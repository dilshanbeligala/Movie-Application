import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  var movie;
  final String movieTitle = 'The Dark Knight'; // Specify the movie title here

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('http://www.omdbapi.com/',
          queryParameters: {'apikey': '38f4414c', 't': movieTitle});
      if (response.statusCode == 200) {
        setState(() {
          movie = response.data;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        title: Center(
          child: Text(
            "Movies ",
            style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Container(
          //   height: size.height,
          //   width: size.width,
          //   color: Color(0xff212420),
          // ),
          // Container(
          //   height: 250,
          //   width: 360,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Card(
          //         elevation: 6,
          //         child: Column(
          //           children: [
          //             Image.network(
          //               Movie[index]['Poster'],
          //               alignment: Alignment.topLeft,
          //               height: 200,
          //             ),
          //             Text(MovieList[index]['Title'])
          //           ],
          //         ),
          //       );
          //     },
          //     itemCount: MovieList == null ? 0 : MovieList.length,
          //   ),
          // ),
        ],
      ),
    );
  }
}
