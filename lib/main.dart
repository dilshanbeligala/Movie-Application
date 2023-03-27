import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:movie_application/screens/description.dart';

import 'package:movie_application/screens/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Check if running on a compatible platform
  if (!kIsWeb && !Platform.isIOS && !Platform.isAndroid) {
    throw Exception('This app is not compatible with this platform.');
  }
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
