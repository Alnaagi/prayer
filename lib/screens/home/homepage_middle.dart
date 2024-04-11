import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer/common/locationaddress.dart';

import 'package:prayer/common/prayer_widget_refresh.dart';
import 'package:prayer/common/countdowntimer_refresh.dart';
import 'package:prayer/screens/home/homepage_left.dart';
import 'package:prayer/screens/home/homepage_right.dart';

import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// var _today = HijriCalendar.now();
// int time = 0;
// Timer? timer;
// Timer? timer2;
// bool mainpage = false;

class HomePageCopy extends StatefulWidget {
  const HomePageCopy({super.key});

  @override
  State<HomePageCopy> createState() => _HomePageCopyState();
}

class _HomePageCopyState extends State<HomePageCopy> {
  @override
  Widget build(BuildContext context) {
    // if (prayerTimes.ishaStartTime!.isAfter(testtimecurrent)) {
    //   AwesomeNotifications().createNotification(
    //       content: NotificationContent(
    //           id: 1,
    //           channelKey: "prayer_channel",
    //           title: "اذان صلاة ${current}",
    //           body: "حان الان الوقت لأذان صلاة ${current}"));

    //   AwesomeNotifications().createNotification(
    //       content: NotificationContent(
    //           id: 2,
    //           channelKey: 'prayer_channel',
    //           title: 'اذانaaaa صلاة ${current}',
    //           body: 'حان الان الوقت لأذان صلاة ${current}'),
    //       schedule: NotificationCalendar(
    //           hour: 03, minute: 03, second: 00, repeats: true));
    // }
    // final _controller = PageController(
    //   initialPage: 1,
    // );
    // int selectTab = 0;
    // int _selectedIndex = 0;

    var media = MediaQuery.of(context).size;
    // ImageProvider logo = const AssetImage("assets/images/home1.jpg");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: media.height * 0.06,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  changetimer = !changetimer;
                });
              },
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
                      child: CountTimerPrayer(),
                    ),
                  ),
                ),
              ),
            ),
            const PrayerWidget(),
          ],
        ),
      ),
    );
  }
}
