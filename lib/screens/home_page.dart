import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/components/movie_list.dart';
import 'package:movie_application/screens/components/series_list.dart';
import 'package:movie_application/screens/search_list.dart';
import 'package:movie_application/screens/search_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        title: Center(
          child: Text(
            "Movies & Series",
            style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SearchList()));
                },
                icon: Icon(Icons.search)),
          )
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              // child: Container(
              //     margin: EdgeInsets.only(
              //         top: screenHeight * 0.01, bottom: screenHeight * 0.01),
              //     width: MediaQuery.of(context).size.width,
              //     height: screenHeight * 0.06,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              // child: TextFormField(
              //   autofocus: false,

              //   // onChanged: ((value) => updateList(value)),
              //   decoration: InputDecoration(
              //       hintText: "Search Movies & Series here....",
              //       hintStyle: GoogleFonts.inter(
              //           color: Color.fromARGB(255, 0, 0, 0),
              //           fontWeight: FontWeight.bold,
              //           fontSize: 17),
              //       //
              //       prefixIcon: Icon(
              //         Icons.search,
              //         size: screenWidth * 0.05,
              //         color: Color.fromARGB(255, 5, 5, 5),
              //       )),
              // )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "See All ->",
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(height: 250, width: 360, child: MovieListView()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sereis",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "See All ->",
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(height: 250, width: 360, child: SeriesListView()),
          ],
        ),
      ]),
    );
  }
}
