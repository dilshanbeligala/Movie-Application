import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:movie_application/screens/description.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  List<dynamic> movieList = [];
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

  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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
                ),
              ),
            );
          },
          child: Card(
            elevation: 6,
            child: Image.network(
              movieList[index]['Poster'],
              alignment: Alignment.topLeft,
              height: 200,
            ),
          ),
        );
      },
      itemCount: movieList == null ? 0 : movieList.length,
    );
  }
}
