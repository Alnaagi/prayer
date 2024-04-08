// import 'package:flutter/material.dart';

// import 'dart:async';
// import 'dart:ui';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:prayer/common/locationaddress.dart';
// import 'package:prayer/controller/test2.dart';
// import 'package:prayer/screens/home/homepage_middle.dart';
// import 'package:prayer/screens/home_bar.dart';
// import 'package:prayer/var/var.dart';
// import 'package:prayers_times/prayers_times.dart';

// DateTime date = DateTime.now();
// Timer? timer2;

// class NotifSchedule extends StatefulWidget {
//   const NotifSchedule({super.key});

//   @override
//   State<NotifSchedule> createState() => _NotifScheduleState();
// }

// class _NotifScheduleState extends State<NotifSchedule> {
//   @override
//   void initState() {
//     // _timerrefresh();
//     test2.Notif2();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void _timerrefresh() async {
//     timer2 = Timer.periodic(Duration(seconds: 5), (_) async {
//       setState(() {
//         print("Canceled///2555555////");
//         Notif();
//         timer2?.cancel();
//       });
//     });
//   }

//   // void _timerrefreshcancel() async {
//   //   timer20 = Timer.periodic(Duration(seconds: 7), (_) async {
//   //     if (mounted) {
//   //       setState(() {
//   //         timer2?.cancel();
//   //       });
//   //     }
//   //   });
//   // }

//   void Notif() async {
//     Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);
//     print("///Notif\\\\");
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
//     test2();
//     final now = DateTime.now();
//     DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
//     PrayerTimes prayerTimes1 = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       dateTime: tomorrow,
//       precision: true,
//       locationName: timeZone,
//     );

//     // DateTime tomorrow2 = DateTime(now.year, now.month, now.day + 2);
//     // PrayerTimes prayerTimes2 = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   dateTime: tomorrow2,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

//     // DateTime tomorrow3 = DateTime(now.year, now.month, now.day + 3);
//     // PrayerTimes prayerTimes3 = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   dateTime: tomorrow3,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

//     // DateTime tomorrow4 = DateTime(now.year, now.month, now.day + 4);
//     // PrayerTimes prayerTimes4 = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   dateTime: tomorrow4,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

//     // DateTime tomorrow5 = DateTime(now.year, now.month, now.day + 5);
//     // PrayerTimes prayerTimes5 = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   dateTime: tomorrow5,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

//     // DateTime tomorrow6 = DateTime(now.year, now.month, now.day + 6);
//     // PrayerTimes prayerTimes6 = PrayerTimes(
//     //   coordinates: coordinates,
//     //   calculationParameters: params,
//     //   dateTime: tomorrow6,
//     //   precision: true,
//     //   locationName: timeZone,
//     // );

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 10,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان الفجر',
//           body: 'بقي على أذان صلاة الفجر 5 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: null,
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.fajrStartTime!.hour,
//                 prayerTimes.fajrStartTime!.minute - 5),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 11,
//           channelKey: 'prayer_channel',
//           title: 'أذان الفجر ',
//           body: 'حان الان موعد أذان صلاة الفجر',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: null,
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.fajrStartTime!.hour,
//                 prayerTimes.fajrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 12,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة الفجر',
//           body: 'مضى على أذان صلاة الفجر 10 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.fajrStartTime!.hour,
//                 prayerTimes.fajrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 20,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان الظهر',
//           body: 'بقي على أذان صلاة الظهر 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.dhuhrStartTime!.hour,
//                 prayerTimes.dhuhrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 21,
//           channelKey: 'prayer_channel',
//           title: 'أذان الظهر ',
//           body: 'حان الان موعد أذان صلاة الظهر',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.dhuhrStartTime!.hour,
//                 prayerTimes.dhuhrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 22,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة الظهر',
//           body: 'مضى على أذان صلاة الفجر 10 الظهر',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.dhuhrStartTime!.hour,
//                 prayerTimes.dhuhrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 30,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان العصر',
//           body: 'بقي على أذان صلاة العصر 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.asrStartTime!.hour,
//                 prayerTimes.asrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 31,
//           channelKey: 'prayer_channel',
//           title: 'أذان العصر ',
//           body: 'حان الان موعد أذان صلاة العصر',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.asrStartTime!.hour,
//                 prayerTimes.asrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 32,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة العصر',
//           body: 'مضى على أذان صلاة العصر 10 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.asrStartTime!.hour,
//                 prayerTimes.asrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 40,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان المغرب',
//           body: 'بقي على أذان صلاة المغرب 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.maghribStartTime!.hour,
//                 prayerTimes.maghribStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 41,
//           channelKey: 'prayer_channel',
//           title: 'أذان المغرب ',
//           body: 'حان الان موعد أذان صلاة المغرب',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.maghribStartTime!.hour,
//                 prayerTimes.maghribStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 42,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة المغرب',
//           body: 'مضى على أذان صلاة المغرب 3 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.maghribStartTime!.hour,
//                 prayerTimes.maghribStartTime!.minute + 3),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 50,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان العشاء',
//           body: 'بقي على أذان صلاة العشاء 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.ishaStartTime!.hour,
//                 prayerTimes.ishaStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 51,
//           channelKey: 'prayer_channel',
//           title: 'أذان العشاء ',
//           body: 'حان الان موعد أذان صلاة العشاء',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.ishaStartTime!.hour,
//                 prayerTimes.ishaStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 52,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة العشاء',
//           body: 'مضى على أذان صلاة العشاء 10 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 date.year,
//                 date.month,
//                 date.day,
//                 prayerTimes.maghribStartTime!.hour,
//                 prayerTimes.maghribStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 110,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان الفجر',
//           body: 'بقي على أذان صلاة الفجر 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.fajrStartTime!.hour,
//                 prayerTimes1.fajrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 111,
//           channelKey: 'prayer_channel',
//           title: 'أذان الفجر ',
//           body: 'حان الان موعد أذان صلاة الفجر',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.fajrStartTime!.hour,
//                 prayerTimes1.fajrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 112,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة الفجر',
//           body: 'مضى على أذان صلاة الفجر 10 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.fajrStartTime!.hour,
//                 prayerTimes1.fajrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 120,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان الظهر',
//           body: 'بقي على أذان صلاة الظهر 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.dhuhrStartTime!.hour,
//                 prayerTimes1.dhuhrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 121,
//           channelKey: 'prayer_channel',
//           title: 'أذان الظهر ',
//           body: 'حان الان موعد أذان صلاة الظهر',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.dhuhrStartTime!.hour,
//                 prayerTimes1.dhuhrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 122,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة الظهر',
//           body: 'مضى على أذان صلاة الفجر 10 الظهر',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.dhuhrStartTime!.hour,
//                 prayerTimes1.dhuhrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 130,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان العصر',
//           body: 'بقي على أذان صلاة العصر 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.asrStartTime!.hour,
//                 prayerTimes1.asrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 131,
//           channelKey: 'prayer_channel',
//           title: 'أذان العصر ',
//           body: 'حان الان موعد أذان صلاة العصر',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.asrStartTime!.hour,
//                 prayerTimes1.asrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 132,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة العصر',
//           body: 'مضى على أذان صلاة العصر 10 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.asrStartTime!.hour,
//                 prayerTimes1.asrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 140,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان المغرب',
//           body: 'بقي على أذان صلاة المغرب 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 141,
//           channelKey: 'prayer_channel',
//           title: 'أذان المغرب ',
//           body: 'حان الان موعد أذان صلاة المغرب',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 142,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة المغرب',
//           body: 'مضى على أذان صلاة المغرب 3 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute + 3),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 150,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان العشاء',
//           body: 'بقي على أذان صلاة العشاء 10 دقائق',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.ishaStartTime!.hour,
//                 prayerTimes1.ishaStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 151,
//           channelKey: 'prayer_channel',
//           title: 'أذان العشاء ',
//           body: 'حان الان موعد أذان صلاة العشاء',
//           wakeUpScreen: true,

//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           // autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.ishaStartTime!.hour,
//                 prayerTimes1.ishaStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 152,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة العشاء',
//           body: 'مضى على أذان صلاة العشاء 10 دقائق',
//           wakeUpScreen: true,
//           // category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 date.day + 1,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HomeBar();
//   }
// }
