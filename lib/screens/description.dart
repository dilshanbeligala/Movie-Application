import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/components/navbar.dart';

class Description extends StatelessWidget {
  final String name, description, poster, rdate, time, id;

  Description({
    super.key,
    required this.name,
    required this.description,
    required this.poster,
    required this.rdate,
    required this.time,
    required this.id,
  });
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
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Center(child: Text(id)),
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: screenHeight * 0.3,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: screenHeight * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      poster,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.av_timer_rounded,
                    color: Color.fromARGB(255, 217, 255, 3),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 217, 255, 3)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 30,
                  ),
                  Icon(Icons.favorite, color: Colors.white, size: 30),
                  Icon(Icons.share, color: Colors.white, size: 30)
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(
                name,
                style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(
                "Released Date - " + rdate,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 217, 255, 3)),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.01, top: screenHeight * 0.02),
                  child: Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.4,
                    child: Image.network(poster),
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.01, right: screenWidth * 0.05),
                  child: Container(
                    child: Text(
                      description,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
