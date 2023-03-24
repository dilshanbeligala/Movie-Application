import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movie_application/screens/description.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    return Scaffold(body: ListView.builder(
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
                          Text(filteredMovieList[index]['Title']),
                          Text("data")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    ));
  }
}
