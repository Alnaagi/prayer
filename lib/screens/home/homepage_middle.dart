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
import 'package:app_settings/app_settings.dart';

// var _today = HijriCalendar.now();
// int time = 0;
// Timer? timer;
// Timer? timer2;
// bool mainpage = false;

class HomePageCopy extends StatefulWidget {
  HomePageCopy({super.key});

  @override
  State<HomePageCopy> createState() => _HomePageCopyState();
}

class _HomePageCopyState extends State<HomePageCopy> {
//  Location location = new Location();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLocationAndBatteryDialog();
    });
  }

  Future<void> _showLocationAndBatteryDialog() async {
    // bool isLocationServiceEnabled = await location.serviceEnabled();
    // if (!isLocationServiceEnabled) {
    //   // Show dialog to enable location service
    //   bool shouldRequestLocation = await showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Enable Location Service'),
    //       content: Text('Please enable location service to use this app.'),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pop(true),
    //           child: Text('Enable'),
    //         ),
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pop(false),
    //           child: Text('Cancel'),
    //         ),
    //       ],
    //     ),
    //   ) ?? false;

    //   if (shouldRequestLocation) {
    //     await location.requestService();
    //   }
    // }

    // Check for battery optimization
    // Note: Direct disabling of battery optimization is not possible due to security restrictions
    // Instead, guide the user to the battery optimization settings
    // bool isIgnoringBatteryOptimizations =
    //     await location.isIgnoringBatteryOptimizations();
    // if (!isIgnoringBatteryOptimizations) {
    //   // Show dialog to navigate to battery optimization settings
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Disable Battery Optimization',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: 185,
          child: Column(
            children: [
              Text(
                'Please to ensure the app functions correctly.\fFollow these steps:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '1-Open Settings. \f2-Change "Not optimized" to \f "All Apps". \f3-Find the app. \f4-Choose "Dont optimize".',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              AppSettings.openAppSettings(
                  type: AppSettingsType.batteryOptimization);
              Navigator.of(context).pop();
            },
            child: Text(
              'Open Settings',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

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
                child: CountTimerPrayer(),
              ),
            ),
          ),
          const PrayerWidget(),
        ],
      ),
    );
  }
}
