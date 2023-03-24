import 'package:flutter/material.dart';

import 'package:movie_application/screens/description.dart';

import 'package:movie_application/screens/home_page.dart';
import 'package:movie_application/screens/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    );
  }
}
