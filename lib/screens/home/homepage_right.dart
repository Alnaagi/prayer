import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:prayer/common/next_date.dart';

import 'package:prayer/common/prayer_widget_refresh.dart';
import 'package:prayer/common/right_page_date.dart';

// int time = 0;
// Timer? timer;
// Timer? timer2;
// bool mainpage = false;

class HomePageRight extends StatefulWidget {
  const HomePageRight({super.key});

  @override
  State<HomePageRight> createState() => _HomePageRightState();
}

class _HomePageRightState extends State<HomePageRight> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: media.height,
        width: media.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: logo, fit: BoxFit.fill),
        // ),
        child: SingleChildScrollView(
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
                      child: NextDatePage(),
                    ),
                  ),
                ),
              ),
            ),
            PrayerWidgetRight(),
          ]),
        ),
      ),
    );
  }
}
