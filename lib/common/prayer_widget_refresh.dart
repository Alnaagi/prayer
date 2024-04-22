import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/prayer_calculation_method.dart';

import 'package:prayers_times/prayers_times.dart';

// class Refreshgood {
//   static Future maingood() async {
//     mainpage2 = true;
//     print("goodr");
//   }
// }
class PrayerWidget2 extends StatelessWidget {
  const PrayerWidget2({super.key, required this.obj});
  final Map obj;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            height: media.height * 0.088,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // border:
              //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

              boxShadow: [
                BoxShadow(
                    blurRadius: 0,
                    color: obj["activeColor"],
                    spreadRadius: 5,
                    offset: const Offset(2, 4))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  // alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      obj["Time"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      // textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Align(
                  //  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      obj["Name"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      // textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrayerWidget extends StatefulWidget {
  const PrayerWidget({
    super.key,
  });

  @override
  State<PrayerWidget> createState() => _PrayerWidgetState();
}

class _PrayerWidgetState extends State<PrayerWidget> {
  int time = 0;
  Timer? timer;
  Timer? timer2;
  Timer? timerazan;
  bool mainpage2 = false;

  bool timera = false;

  // static Future testinggood() async {
  //   mainpage2 = false;
  //   print("good222");
  // }

  void initState() {
    // _homepagerefresh();
    _timercanceler();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    timer?.cancel();
    timer2?.cancel();
  }

  bool aftertext = false;
  // bool changetimer = false;

  void _homepagerefresh() {
    // Location stream for continuous updates (if available)
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      print("Refresh///////");

      if (mounted) {
        setState(() {
          mainpage2 = false;
          timer?.cancel();
          _timercanceler();
        });
      }
    });
  }

  void _timercanceler() async {
    timer2 = Timer.periodic(const Duration(seconds: 10), (timer2) async {
      if (mounted) {
        setState(() {
          mainpage2 = false;
          print("Canceled///////");
          timer2.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var _format = HijriCalendar.now();
    // print(_format.fullDate()); //Thulatha, Ramadan 14, 1439 h
    // print(_format.toFormat("mm dd yy")); //09 14 39
    // while (time <= 500) {
    //   print("object");
    //   setState(() {
    //     time++;
    //     print("object");
    //   });
    // }

    Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);

// Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.custom();
    params.madhab = PrayerMadhab.shafi;
// Create a PrayerTimes instance for the specified location
    PrayerTimes prayerTimes = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      precision: true,
      locationName: timeZone,
    );

    // final now = DateTime.now();
    // DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    // PrayerTimes prayerTimes1 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow,
    //   precision: true,
    //   locationName: timeZone,
    // );

//     DateTime tomorrow2 = DateTime(now.year, now.month, now.day + 2);
//     PrayerTimes prayerTimes2 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow2,
//       precision: true,
//       locationName: timeZone,
//     );

//     DateTime tomorrow3 = DateTime(now.year, now.month, now.day + 3);
//     PrayerTimes prayerTimes3 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow3,
//       precision: true,
//       locationName: timeZone,
//     );

//     DateTime tomorrow4 = DateTime(now.year, now.month, now.day + 4);
//     PrayerTimes prayerTimes4 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow4,
//       precision: true,
//       locationName: timeZone,
//     );

//     DateTime tomorrow5 = DateTime(now.year, now.month, now.day + 5);
//     PrayerTimes prayerTimes5 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow5,
//       precision: true,
//       locationName: timeZone,
//     );

//     DateTime tomorrow6 = DateTime(now.year, now.month, now.day + 6);
//     PrayerTimes prayerTimes6 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow6,
//       precision: true,
//       locationName: timeZone,
//     );

// // Display convenience utilities for prayer times
//     // String current = prayerTimes.currentPrayer();
//     // String next = prayerTimes.nextPrayer();
//     // print(prayerTimes.timeForPrayer(current));

//     // String Test555 = prayerTimes.timeForPrayer(current).toString();
//     // print("$Test555/test");
//     // DateTime testtime = DateTime.parse(Test555);
//     // print(testtime);

//     // print("$latitude,$longitude");
//     // Define the geographical coordinates for the location
//     // Coordinates(latitudeloc, longitudeloc);
//     // print(latitudeloc);
//     // print(longitudeloc);
//     // print(timeZone);
//     // // Specify the calculation parameters for prayer times
//     // PrayerCalculationParameters params = PrayerCalculationMethod.custom();
//     // params.madhab = PrayerMadhab.shafi;

//     // // Create a PrayerTimes instance for the specified location
//     // PrayerTimes prayerTimes = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

//     // final now = DateTime.now();
//     // DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
//     // PrayerTimes prayerTimes1 = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   dateTime: tomorrow,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

//     // // Display convenience utilities for prayer times
//     String current = prayerTimes.currentPrayer();
//     String next = prayerTimes.nextPrayer();

    bool isha_ActiveColor = false;
    bool maghrib_ActiveColor = false;
    bool asr_ActiveColor = false;
    bool dhuhr_ActiveColor = false;
    bool sunrise_ActiveColor = false;
    bool fajr_ActiveColor = false;

    // if prayer time is now the function will output
    DateTime date = DateTime.now();
    if (date.isAfter(prayerTimes.ishaStartTime!)) {
      // print("isha");
      isha_ActiveColor = !isha_ActiveColor;
    } else if (date.isAfter(prayerTimes.maghribStartTime!)) {
      // print("maghrib");
      maghrib_ActiveColor = !maghrib_ActiveColor;
    } else if (date.isAfter(prayerTimes.asrStartTime!)) {
      // print("asr");
      asr_ActiveColor = !asr_ActiveColor;
    } else if (date.isAfter(prayerTimes.dhuhrStartTime!)) {
      // print("dhuhr");
      dhuhr_ActiveColor = !dhuhr_ActiveColor;
    } else if (date.isAfter(prayerTimes.sunrise!)) {
      // print("sunrise");
      sunrise_ActiveColor = !sunrise_ActiveColor;
    } else if (date.isAfter(prayerTimes.fajrStartTime!)) {
      // print("fajr");
      fajr_ActiveColor = !fajr_ActiveColor;
    } else if (date.isAfter(prayerTimes.ishaEndTime!)) {
      // print("isha");
      isha_ActiveColor = false;
    }

    //media size
    List listArr = [
      {
        "Name": LocalData.Fajr.getString(context),
        "Time": "${prayerTimes.fajrStartTime!}",
        "activeColor": fajr_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.sunrise.getString(context),
        "Time": "\t${prayerTimes.sunrise!}",
        "activeColor": sunrise_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Dhuhr.getString(context),
        "Time": "\t${prayerTimes.dhuhrStartTime!}",
        "activeColor": dhuhr_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Asr.getString(context),
        "Time": "\t${prayerTimes.asrStartTime!}",
        "activeColor": asr_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Maghrib.getString(context),
        "Time": "\t${prayerTimes.maghribStartTime!}",
        "activeColor": maghrib_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Isha.getString(context),
        "Time": "\t${prayerTimes.ishaStartTime!}",
        "activeColor": isha_ActiveColor ? Colors.amber : Colors.white70,
      },
    ];

    // print("goodr65\\\\\\\999\6");
    var media = MediaQuery.of(context).size;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shrinkWrap: true,
      itemCount: listArr.length,
      itemBuilder: (context, index) {
        var obj = listArr[index] as Map? ?? {};
        // return
        //  PrayerWidget(obj: obj);
        return PrayerWidget2(obj: obj);
      },
    );
  }
}






//    void AzanToday() {
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 10,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان الفجر',
//             body: 'بقي على أذان صلاة الفجر 5 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: null,
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.fajrStartTime!.hour,
//                   prayerTimes.fajrStartTime!.minute - 5),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 11,
//             channelKey: 'prayer_channel',
//             title: 'أذان الفجر ',
//             body: 'حان الان موعد أذان صلاة الفجر',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: null,
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.fajrStartTime!.hour,
//                   prayerTimes.fajrStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 12,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة الفجر',
//             body: 'مضى على أذان صلاة الفجر 10 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.fajrStartTime!.hour,
//                   prayerTimes.fajrStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 20,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان الظهر',
//             body: 'بقي على أذان صلاة الظهر 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.dhuhrStartTime!.hour,
//                   prayerTimes.dhuhrStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 21,
//             channelKey: 'prayer_channel',
//             title: 'أذان الظهر ',
//             body: 'حان الان موعد أذان صلاة الظهر',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.dhuhrStartTime!.hour,
//                   prayerTimes.dhuhrStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 22,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة الظهر',
//             body: 'مضى على أذان صلاة الفجر 10 الظهر',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.dhuhrStartTime!.hour,
//                   prayerTimes.dhuhrStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 30,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان العصر',
//             body: 'بقي على أذان صلاة العصر 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.asrStartTime!.hour,
//                   prayerTimes.asrStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 31,
//             channelKey: 'prayer_channel',
//             title: 'أذان العصر ',
//             body: 'حان الان موعد أذان صلاة العصر',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.asrStartTime!.hour,
//                   prayerTimes.asrStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 32,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة العصر',
//             body: 'مضى على أذان صلاة العصر 10 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.asrStartTime!.hour,
//                   prayerTimes.asrStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 40,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان المغرب',
//             body: 'بقي على أذان صلاة المغرب 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.maghribStartTime!.hour,
//                   prayerTimes.maghribStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 41,
//             channelKey: 'prayer_channel',
//             title: 'أذان المغرب ',
//             body: 'حان الان موعد أذان صلاة المغرب',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.maghribStartTime!.hour,
//                   prayerTimes.maghribStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 42,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة المغرب',
//             body: 'مضى على أذان صلاة المغرب 3 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.maghribStartTime!.hour,
//                   prayerTimes.maghribStartTime!.minute + 3),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 50,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان العشاء',
//             body: 'بقي على أذان صلاة العشاء 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.ishaStartTime!.hour,
//                   prayerTimes.ishaStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 51,
//             channelKey: 'prayer_channel',
//             title: 'أذان العشاء ',
//             body: 'حان الان موعد أذان صلاة العشاء',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.ishaStartTime!.hour,
//                   prayerTimes.ishaStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 52,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة العشاء',
//             body: 'مضى على أذان صلاة العشاء 10 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   date.year,
//                   date.month,
//                   date.day,
//                   prayerTimes.maghribStartTime!.hour,
//                   prayerTimes.maghribStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////
//     }

//     AzanToday();

//     void AzanToday1() {
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 110,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان الفجر',
//             body: 'بقي على أذان صلاة الفجر 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.fajrStartTime!.hour,
//                   prayerTimes1.fajrStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 111,
//             channelKey: 'prayer_channel',
//             title: 'أذان الفجر ',
//             body: 'حان الان موعد أذان صلاة الفجر',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.fajrStartTime!.hour,
//                   prayerTimes1.fajrStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 112,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة الفجر',
//             body: 'مضى على أذان صلاة الفجر 10 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.fajrStartTime!.hour,
//                   prayerTimes1.fajrStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 120,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان الظهر',
//             body: 'بقي على أذان صلاة الظهر 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.dhuhrStartTime!.hour,
//                   prayerTimes1.dhuhrStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 121,
//             channelKey: 'prayer_channel',
//             title: 'أذان الظهر ',
//             body: 'حان الان موعد أذان صلاة الظهر',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.dhuhrStartTime!.hour,
//                   prayerTimes1.dhuhrStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 122,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة الظهر',
//             body: 'مضى على أذان صلاة الفجر 10 الظهر',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.dhuhrStartTime!.hour,
//                   prayerTimes1.dhuhrStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 130,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان العصر',
//             body: 'بقي على أذان صلاة العصر 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.asrStartTime!.hour,
//                   prayerTimes1.asrStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 131,
//             channelKey: 'prayer_channel',
//             title: 'أذان العصر ',
//             body: 'حان الان موعد أذان صلاة العصر',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.asrStartTime!.hour,
//                   prayerTimes1.asrStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 132,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة العصر',
//             body: 'مضى على أذان صلاة العصر 10 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.asrStartTime!.hour,
//                   prayerTimes1.asrStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 140,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان المغرب',
//             body: 'بقي على أذان صلاة المغرب 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.maghribStartTime!.hour,
//                   prayerTimes1.maghribStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 141,
//             channelKey: 'prayer_channel',
//             title: 'أذان المغرب ',
//             body: 'حان الان موعد أذان صلاة المغرب',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.maghribStartTime!.hour,
//                   prayerTimes1.maghribStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 142,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة المغرب',
//             body: 'مضى على أذان صلاة المغرب 3 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.maghribStartTime!.hour,
//                   prayerTimes1.maghribStartTime!.minute + 3),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 150,
//             channelKey: 'prayer_channel',
//             title: 'اقترب أذان العشاء',
//             body: 'بقي على أذان صلاة العشاء 10 دقائق',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.ishaStartTime!.hour,
//                   prayerTimes1.ishaStartTime!.minute - 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 151,
//             channelKey: 'prayer_channel',
//             title: 'أذان العشاء ',
//             body: 'حان الان موعد أذان صلاة العشاء',
//             wakeUpScreen: true,

//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             // autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   tomorrow.day,
//                   prayerTimes1.ishaStartTime!.hour,
//                   prayerTimes1.ishaStartTime!.minute),
//               preciseAlarm: true,
//               allowWhileIdle: true));

//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: 152,
//             channelKey: 'prayer_channel',
//             title: 'إقامة صلاة العشاء',
//             body: 'مضى على أذان صلاة العشاء 10 دقائق',
//             wakeUpScreen: true,
//             // category: NotificationCategory.Reminder,
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule: NotificationCalendar.fromDate(
//               date: DateTime(
//                   tomorrow.year,
//                   tomorrow.month,
//                   date.day + 1,
//                   prayerTimes1.maghribStartTime!.hour,
//                   prayerTimes1.maghribStartTime!.minute + 10),
//               preciseAlarm: true,
//               allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//       ////////////////////////////////////////////////////////////////////
//     }

//     AzanToday1();