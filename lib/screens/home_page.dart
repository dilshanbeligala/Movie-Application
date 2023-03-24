import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/components/movie_list.dart';
import 'package:movie_application/screens/components/series_list.dart';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        title: Center(
          child: Text(
            "Movies & Series",
            style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                  width: MediaQuery.of(context).size.width,
                  height: screenHeight * 0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    // onChanged: ((value) => updateList(value)),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(44, 0, 0, 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Search Movies & Series here....",
                        hintStyle: GoogleFonts.inter(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        //
                        prefixIcon: Icon(
                          Icons.search,
                          size: screenWidth * 0.06,
                          color: Color.fromARGB(255, 5, 5, 5),
                        )),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All ->",
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.bold),
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
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All ->",
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.bold),
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
