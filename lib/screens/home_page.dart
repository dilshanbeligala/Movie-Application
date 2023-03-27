import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/components/movie_list.dart';
import 'package:movie_application/screens/components/navbar.dart';
import 'package:movie_application/screens/components/series_list.dart';
import 'package:movie_application/screens/searchSlist.dart';
import 'package:movie_application/screens/search_list.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _currentBottomIndex = 0;
  void _handleBottomIndexChange(int? index) {
    _currentBottomIndex = index!;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
          index: _currentBottomIndex, onTap: _handleBottomIndexChange),
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Movies & Series",
          style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.02, right: screenWidth * 0.02),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies",
                    style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchList()));
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            // ignore: sized_box_for_whitespace
            Container(height: 250, width: 360, child: const MovieListView()),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sereis",
                    style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Search_SList()));
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            // ignore: sized_box_for_whitespace
            Container(height: 250, width: 360, child: const SeriesListView()),
            SizedBox(
              height: screenHeight * 0.025,
            ),
          ],
        ),
      ]),
    );
  }
}
