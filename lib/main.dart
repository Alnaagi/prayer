// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:prayer/screens/home_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/hourburj.png"), context);
    precacheImage(const AssetImage("assets/images/sand.png"), context);
    precacheImage(const AssetImage("assets/images/rus4.png"), context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeBar(),
    );
  }
}
