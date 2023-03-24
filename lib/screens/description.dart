import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Center(child: Text(id)),
        backgroundColor: Color.fromARGB(255, 9, 0, 18),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      poster,
                      fit: BoxFit.cover,
                      width: 320,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
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
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.download),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.favorite),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.share),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                name,
                style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
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
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 200,
                    width: 100,
                    child: Image.network(poster),
                  ),
                ),
                Flexible(
                    child: Container(
                  child: Text(
                    description,
                    style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(50)),
      //         child: Image.network(
      //           poster,
      //           fit: BoxFit.cover,
      //           width: 320,
      //         ),
      //       ),
      //       Center(
      //         child: Text(
      //           name,
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       Center(
      //         child: Text(
      //           rdate,
      //           style: TextStyle(fontSize: 20),
      //         ),
      //       ),
      //       Text(description),
      //       Text(time),
      //       Text(id),
      //     ],
      //   ),
      // ),
    );
  }
}
