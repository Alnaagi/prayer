// import 'dart:async';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hijri/hijri_calendar.dart';
// import 'package:intl/intl.dart' as intl;
// import 'package:prayer/common/locationaddress.dart';
// import 'package:prayer/screens/azkar/afterprayer.dart';

// import 'package:prayer/var/var.dart';
// import 'package:flutter/material.dart';

// import 'package:prayers_times/prayers_times.dart';

// bool MidnightActive = false;
// bool middiffActive = false;
// bool differenceActive = false;
// bool isFetchingData2 = false;

class NextDatePage extends StatefulWidget {
  const NextDatePage({super.key});

  @override
  State<NextDatePage> createState() => _NextDatePageState();
}

// bool isFetchingData2 = false;
// bool differenceActive = false;
// bool MidnightActive = false;
// bool middiffActive = false;
// bool midswitch = false;

class _NextDatePageState extends State<NextDatePage> {
  // Timer? _timer;
  // Flag to indicate data fetching state

  // @override
  // void initState() {
  //   super.initState();
  //   _startTimer();
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  // void _startTimer() {
  //   const refreshDuration = Duration(milliseconds: 1000);

  //   _timer = Timer.periodic(refreshDuration, (_) async {
  //     setState(() {
  //       isFetchingData2 = true; // Show loading indicator
  //     });
  //     try {
  //       await _fetchData(); // Fetch data asynchronously
  //       setState(() {
  //         isFetchingData2 = false; // Hide loading indicator
  //       });
  //     } catch (error) {
  //       // Handle network errors gracefully (e.g., display an error message)
  //       // print('Error fetching data: $error');
  //     }
  //   });
  // }

  // Future<void> _fetchData() async {
  //   // Your code to fetch data asynchronously (e.g., using a network call)
  //   // ...
  //   // Update state variables based on fetched data (if applicable)
  //   // ...
  // }

  @override
  Widget build(BuildContext context) {
    // Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);
    // @override
//     void initState() {
//       super.initState();
//     }

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

//     final now = DateTime.now();
//     DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
//     PrayerTimes prayerTimes1 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow,
//       precision: true,
//       locationName: timeZone,
//     );

// // Display convenience utilities for prayer times
//     String current = prayerTimes.currentPrayer();
//     String next = prayerTimes.nextPrayer();

// ///////////////////////////////////
// //////////// current prayer /////// مضى
//     String Currentprayer =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
//     intl.DateFormat format2 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime PrayerCurrentTime = format2.parse(Currentprayer);

//     testtimecurrent = PrayerCurrentTime;
//     // print(PrayerCurrentTime);
//     // print(Currentprayer);

//     final timenowago = DateTime.now();
//     final difference = timenowago.difference(PrayerCurrentTime);

// ///////////////////////////////////
// //////////// Next prayer ////////// بقي
//     String Nextprayer =
//         "${now.year}-${now.month}-${now.day + 1} ${prayerTimes1.timeForPrayer(next)}:00.000";
//     intl.DateFormat format3 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime PrayerNextTime = format3.parse(Nextprayer);

//     final timenowafter = DateTime.now();
//     final afterdifference = PrayerNextTime.difference(timenowafter);

// ////////////////////////////////
// //////// if after midnight /////  مضى امس
//     String yesterdayprayer =
//         "${now.year}-${now.month}-${now.day - 1} ${prayerTimes.timeForPrayer(current)}:00.000";
//     intl.DateFormat format4 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime yesterday_prayer = format4.parse(yesterdayprayer);

//     final nowww = DateTime.now();
//     final Beforemidnight = nowww.difference(yesterday_prayer);

//     ////////////////////////////////
// //////// if after midnight to fajr /////  بقي غدا
//     String tomorrowprayer =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(next)}:00.000";
//     intl.DateFormat format5 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime tomorrow_prayer = format5.parse(tomorrowprayer);

//     final nowwww = DateTime.now();
//     final Aftermidnight = tomorrow_prayer.difference(nowwww);

//     String tomorrowprayer2 =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
//     intl.DateFormat format6 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime tomorrow_prayer2 = format6.parse(tomorrowprayer2);

//     // final nowwww2 = DateTime.now();
//     // final Aftermidnight2 = DateTime.now()
//     //     .subtract(Duration(days: nowwww2.day, hours: PrayerNextTime.hour));

//     final nowwww2 = DateTime.now();
//     final Aftermidnight2 = DateTime(nowwww.year, now.month, now.day,
//             nowwww2.hour, nowwww2.minute, now.second)
//         .subtract(Duration(
//             hours: prayerTimes.asrEndTime!.minute,
//             minutes: prayerTimes.asrEndTime!.minute));
// ///////////////////////////////////
// //////////// current prayer2 /////// مضى
//     String Currentprayer2 =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
//     intl.DateFormat format8 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime PrayerCurrentTime22 = format8.parse(Currentprayer2);

//     final timenowago2 = DateTime.now();
//     final difference2 = PrayerCurrentTime22.difference(timenowago2);

// ///////////////////////////////////
// //////////// Next prayer2 ////////// بقي
//     String Nextprayer2 =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(next)}:00.000";
//     intl.DateFormat format9 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime PrayerNextTime2 = format9.parse(Nextprayer2);

//     final timenowafter2 = DateTime.now();
//     final afterdifference2 = PrayerNextTime.difference(timenowafter2);

//     // final test = nowwww2.difference();

//     String durationToString(int minutes) {
//       var d = Duration(
//         seconds: minutes,
//       );
//       List<String> parts = d.toString().split(':');
//       return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${parts[2].padLeft(2, '0')}';
//     }

//     // print('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
//     // print(
//     //     "${durationToString(difference.inSeconds).substring(0, 8)} difference");
//     // print(
//     //     "${durationToString(afterdifference.inSeconds).substring(0, 8)} afterdifference");
//     // print(
//     //     "${durationToString(Beforemidnight.inSeconds).substring(0, 8)} Beforemidnight");
//     // print(
//     //     "${durationToString(Aftermidnight.inSeconds).substring(1, 9)} Aftermidnight");
//     // print('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');

//     // print(durationToString(afterdifference.inSeconds));
//     // print(durationToString(Beforemidnight.inSeconds));
//     // print(durationToString(Aftermidnight.inSeconds));

//     // print("difference${difference.inMinutes}");
//     // print("afterdifference${afterdifference.inMinutes}");
//     // print("Beforemidnight${Beforemidnight.inMinutes}");
//     // print("Aftermidnight${Aftermidnight.inMinutes}");
//     // print("Current*******${difference2.inMinutes}");
//     // print("Next*******${test}");
//     // print("Next*******${PrayerNextTime2}");
//     // print("Next*******${difference2}");

// ////////////////////////////////////////////////////////////////////////

//     if (Aftermidnight.inDays >= Beforemidnight.inDays) {
//       MidnightActive = true;
//       middiffActive = false;

//       // print(
//       // "${durationToString(Aftermidnight.inSeconds)} بقي علي صلاة ${next} ");
//     } else if (difference.inMinutes <= Aftermidnight.inMinutes) {
//       // print("${Aftermidnight.inSeconds} مضى علي ***صلاة ${current} ");
//       MidnightActive = false;
//       differenceActive = true;
//     } else if (Aftermidnight.inMinutes <= difference.inMinutes &&
//         Beforemidnight.inMinutes <= afterdifference.inMinutes) {
//       // print("${durationToString(Aftermidnight.inSeconds)}بقي sunshine ");
//       MidnightActive = true;
//       differenceActive = true;
//     } else if (Aftermidnight.inMinutes >= difference.inMinutes) {
//       // print("${durationToString(difference.inSeconds)}مضى ***");
//       MidnightActive = false;
//       middiffActive = false;
//       differenceActive = true;
//     } else if (afterdifference.inMinutes >= Beforemidnight.inMinutes &&
//         difference.inMinutes <= afterdifference.inMinutes) {
//       // print("${durationToString(Aftermidnight.inSeconds)}مضى *****aaa*****");
//       MidnightActive = false;
//       middiffActive = false;
//       differenceActive = true;
//     } else if (difference.inMinutes <= Aftermidnight.inMinutes &&
//         afterdifference.inMinutes >= Beforemidnight.inMinutes) {
//       MidnightActive = true;
//       middiffActive = false;
//       // differenceActive = true;
//       // print("finish0");
//     } else if (afterdifference.inDays >= Beforemidnight.inDays) {
//       MidnightActive = true;
//       middiffActive = false;

//       // print("finish1");
//     } else {
//       MidnightActive = false;
//       differenceActive = true;
//     }

    // print(PrayerNextTime);
    // print(PrayerCurrentTime);

    // if (now.isAtSameMomentAs(testtimecurrent)) {
    //   AwesomeNotifications().createNotification(
    //       content: NotificationContent(
    //           id: 1,
    //           channelKey: "prayer_channel",
    //           title: "اذان صلاة ${current}",
    //           body: "حان الان الوقت لأذان صلاة ${current}"));
    // }

    final now = DateTime.now();
    DateTime tommorow = DateTime(
        now.year, now.month, now.day + 1, now.hour, now.minute, now.second);
    var _format = HijriCalendar.fromDate(tommorow);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              setState(() {
                HijriCalendar.language = "ar";
              });
            },
            child: Icon(Icons.arrow_back_ios_rounded)),
        Text(
          _format.fullDate(),
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
