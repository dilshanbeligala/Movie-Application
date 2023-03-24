import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/description.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  List<dynamic> movieList = [];
  List<dynamic> filteredMovieList = [];
  dynamic desData;

  @override
  void initState() {
    super.initState();
    getMovieData();
    getDesData();
  }

  void getMovieData() async {
    try {
      var response = await Dio()
          .get('http://www.omdbapi.com/?apikey=38f4414c&type=movie&s=all');
      if (response.statusCode == 200) {
        setState(() {
          movieList = response.data["Search"] as List;
          filteredMovieList = movieList;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void getDesData() async {
    try {
      var response =
          await Dio().get('http://www.omdbapi.com/?apikey=38f4414c&t=the 100');
      if (response.statusCode == 200) {
        setState(() {
          desData = response.data;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void filterMovieList(String searchTerm) {
    setState(() {
      filteredMovieList = movieList
          .where((movie) =>
              movie['Title'].toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search by Movie name',
                  ),
                  onChanged: (value) => filterMovieList(value),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Description(
                          name: movieList[index]['Title'],
                          description: desData['Plot'],
                          poster: movieList[index]['Poster'],
                          rdate: movieList[index]['Year'],
                          time: desData['Runtime'],
                          id: desData['imdbID'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Color.fromARGB(255, 30, 30, 30),
                    child: ListTile(
                      title: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              filteredMovieList[index]['Poster'],
                              height: 150,
                              width: 120,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredMovieList[index]['Title'],
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  movieList[index]['Year'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 246, 255, 0)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "See more",
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount:
                  filteredMovieList == null ? 0 : filteredMovieList.length,
            ),
          ),
        ],
      ),
    );
  }
}
