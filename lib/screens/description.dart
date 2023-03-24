import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name, description, poster, rdate;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.poster,
      required this.rdate});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 9, 0, 18),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Image.network(
                            poster,
                            fit: BoxFit.cover,
                            width: 320,
                          ),
                        ),

                        //
                        // Image.network(
                        //   poster,
                        //   fit: BoxFit.cover,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  rdate,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
