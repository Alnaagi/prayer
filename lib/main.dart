// ignore_for_file: avoid_print

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/controller/notif_controller.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: "prayer_channel_group",
        channelKey: "prayer_channel",
        channelName: "Prayer Notif",
        channelDescription: "Testing Notif for Prayer app")
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "prayer_channel_group",
        channelGroupName: "prayer Group")
  ]);
  bool isAllowedToSendNotifications =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotifications) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);

// // Specify the calculation parameters for prayer times
//     PrayerCalculationParameters params = PrayerCalculationMethod.custom();
//     params.madhab = PrayerMadhab.shafi;
// // Create a PrayerTimes instance for the specified location
//     PrayerTimes prayerTimes = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       precision: true,
//       locationName: timeZone,
//     );

//     // Display convenience utilities for prayer times
//     String current = prayerTimes.currentPrayer();
//     String next = prayerTimes.nextPrayer();

    // if prayer time is now the function will output
    // DateTime date = DateTime.now();
    // if (date.isAfter(prayerTimes.ishaStartTime!)) {
    //   // print("isha");
    //   isha_ActiveColor = !isha_ActiveColor;
    //   // AwesomeNotifications().createNotification(
    //   //     content: NotificationContent(
    //   //         id: 1,
    //   //         channelKey: "prayer_channel",
    //   //         title: "اذان صلاة العشاء",
    //   //         body: "حان الان الوقت لأذان صلاة العشاء"));
    // } else if (date.isAfter(prayerTimes.maghribStartTime!)) {
    //   // print("maghrib");
    //   maghrib_ActiveColor = !maghrib_ActiveColor;
    // } else if (date.isAfter(prayerTimes.asrStartTime!)) {
    //   // print("asr");
    //   asr_ActiveColor = !asr_ActiveColor;
    // } else if (date.isAfter(prayerTimes.dhuhrStartTime!)) {
    //   // print("dhuhr");
    //   dhuhr_ActiveColor = !dhuhr_ActiveColor;
    // } else if (date.isAfter(prayerTimes.sunrise!)) {
    //   // print("sunrise");
    //   sunrise_ActiveColor = !sunrise_ActiveColor;
    // } else if (date.isAfter(prayerTimes.fajrStartTime!)) {
    //   // print("fajr");
    //   fajr_ActiveColor = !fajr_ActiveColor;
    // } else if (date.isAfter(prayerTimes.ishaEndTime!)) {
    //   // print("isha");
    //   isha_ActiveColor = false;
    // }

    precacheImage(const AssetImage("assets/images/hourburj.png"), context);
    precacheImage(const AssetImage("assets/images/sand.png"), context);
    precacheImage(const AssetImage("assets/images/rus4.png"), context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationAddress(),
    );
  }
}
