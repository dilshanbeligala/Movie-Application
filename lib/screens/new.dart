import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/movie_page.dart';

class Home_Page1 extends StatefulWidget {
  const Home_Page1({super.key});

  @override
  State<Home_Page1> createState() => _Home_Page1State();
}

class _Home_Page1State extends State<Home_Page1> {
  List<dynamic> movieList = [];
  List<dynamic> seriesList = [];
  List<dynamic> filteredMovieList = [];
  List<dynamic> filteredSeriesList = [];

  @override
  void initState() {
    super.initState();
    getMovieData();
    getSeriesData();
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

  void getSeriesData() async {
    try {
      var response = await Dio()
          .get('http://www.omdbapi.com/?apikey=38f4414c&s=100&type=series');
      if (response.statusCode == 200) {
        setState(() {
          seriesList = response.data["Search"] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void searchMoviesAndSeries(String input) {
    setState(() {
      filteredMovieList = movieList
          .where((movie) =>
              movie['Title'].toLowerCase().contains(input.toLowerCase()))
          .toList();

      filteredSeriesList = seriesList
          .where((series) =>
              series['Title'].toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

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
                  onChanged: searchMoviesAndSeries,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Search Movies & Series here....",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: screenWidth * 0.06,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredMovieList.length,
                  itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          filteredMovieList[index].district!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onTap: (() {
                          //  Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: ((context) => Donation_page())));
                        }),
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
                  Text("See All >")
                ],
              ),
            ),
            Container(
              height: 250,
              width: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 6,
                    child: Image.network(
                      movieList[index]['Poster'],
                      alignment: Alignment.topLeft,
                      height: 200,
                    ),
                  );
                },
                itemCount: movieList == null ? 0 : movieList.length,
              ),
            ),
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
                  Text("See All >")
                ],
              ),
            ),
            Container(
              height: 250,
              width: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 6,
                    child: Image.network(
                      seriesList[index]['Poster'],
                      alignment: Alignment.topLeft,
                      height: 200,
                    ),
                  );
                },
                itemCount: seriesList == null ? 0 : seriesList.length,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
