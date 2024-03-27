// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer/screens/home/homepage.dart';
import 'package:prayer/var/prayer_var.dart';
import 'package:prayers_times/prayers_times.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
