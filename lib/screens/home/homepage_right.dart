import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

import 'package:prayer/Testing/next_date.dart';

import 'package:prayer/common/right_page_date.dart';

// int time = 0;
// Timer? timer;
// Timer? timer2;
// bool mainpage = false;

class HomePageRight extends StatelessWidget {
  const HomePageRight({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    DateTime tommorow = DateTime(
        now.year, now.month, now.day + 1, now.hour, now.minute, now.second);
    var _format = HijriCalendar.fromDate(tommorow);

    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: media.height * 0.06,
          ),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: Container(
                  height: media.height * .22,
                  width: media.width * .93,
                  decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15),
                    // border:
                    //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.white70,
                          spreadRadius: 5,
                          offset: Offset(2, 4))
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _format.fullDate(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const PrayerWidgetRight(),
        ]),
      ),
    );
  }
}
