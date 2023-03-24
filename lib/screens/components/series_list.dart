import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/screens/description.dart';

class SeriesListView extends StatefulWidget {
  const SeriesListView({Key? key}) : super(key: key);

  @override
  _SeriesListViewState createState() => _SeriesListViewState();
}

class _SeriesListViewState extends State<SeriesListView> {
  List<dynamic> seriesList = [];
  dynamic desData;

  @override
  void initState() {
    super.initState();

    getSeriesData();
    getDesData();
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
                  name: seriesList[index]['Title'],
                  description: desData['Plot'],
                  poster: seriesList[index]['Poster'],
                  rdate: seriesList[index]['Year'],
                  time: desData['Runtime'],
                  id: desData['imdbID'],
                  
                ),
              ),
            );
          },
          child: Card(
            elevation: 6,
            child: Image.network(
              seriesList[index]['Poster'],
              alignment: Alignment.topLeft,
              height: 200,
            ),
          ),
        );
      },
      itemCount: seriesList.length,
    );
  }
}
