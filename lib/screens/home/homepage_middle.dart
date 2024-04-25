import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:prayer/common/prayer_widget_refresh.dart';
import 'package:prayer/common/countdowntimer_refresh.dart';

class HomePageCopy extends StatelessWidget {
  const HomePageCopy({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: media.height * 0.06,
          ),
          ClipRRect(
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
                child: const CountTimerPrayer(),
              ),
            ),
          ),
          const PrayerWidget(),
        ],
      ),
    );
  }
}
