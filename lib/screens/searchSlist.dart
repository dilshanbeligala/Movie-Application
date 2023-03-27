import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/components/navbar.dart';
import 'package:movie_application/screens/description.dart';

class Search_SList extends StatefulWidget {
  const Search_SList({super.key});

  @override
  State<Search_SList> createState() => _Search_SListState();
}

class _Search_SListState extends State<Search_SList> {
  List<dynamic> movieList = [];
  List<dynamic> filteredMovieList = [];
  dynamic desData;
int _currentBottomIndex = 0;
  void _handleBottomIndexChange(int? index) {
    _currentBottomIndex = index!;
  }
  @override
  void initState() {
    super.initState();
    getMovieData();
    getDesData();
  }

  void getMovieData() async {
    try {
      var response = await Dio()
          .get('http://www.omdbapi.com/?apikey=38f4414c&s=100&type=series');
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       bottomNavigationBar: MyBottomBar(
          index: _currentBottomIndex, onTap: _handleBottomIndexChange),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.01,
                bottom: screenHeight * 0.01,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search by series name',
                  ),
                  onChanged: (value) => filterMovieList(value),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
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
                                  height: screenHeight * 0.01,
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
