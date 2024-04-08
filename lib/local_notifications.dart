// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:prayer/var/test.dart';
// import 'package:intl/intl.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:rxdart/rxdart.dart';

// class LocalNotifications {
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static final onClickNotification = BehaviorSubject<String>();

// // on tap on any notification
//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     onClickNotification.add(notificationResponse.payload!);
//   }

//   static Future init() async {
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) => null,
//     );
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);
//     _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (details) => null,
//     );
//   }

//   static Future showSimpleNotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('your channel id', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin
//         .show(0, title, body, notificationDetails, payload: payload);
//   }

//   // to show periodic notification at regular interval
//   static Future showPeriodicNotifications({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('channel 2', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin.periodicallyShow(
//         1, title, body, RepeatInterval.everyMinute, notificationDetails,
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//         payload: payload);
//   }

//   // to schedule a local notification
//   static Future showScheduleNotification(
//       {int id = 0,
//       required String title,
//       required String body,
//       required String payload,
//       required DateTime scheduledNotificationDateTime}) async {
//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
//         const NotificationDetails(
//             android: AndroidNotificationDetails(
//                 icon: '@mipmap/ic_launcher',
//                 'channel 3',
//                 'your channel name',
//                 channelDescription: 'your channel description',
//                 importance: Importance.max,
//                 priority: Priority.high,
//                 ticker: 'ticker')),
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         payload: payload);
//   }

//   // close a specific channel notification
//   static Future cancel(int id) async {
//     await _flutterLocalNotificationsPlugin.cancel(id);
//   }

//   // close all the notifications available
//   static Future cancelAll() async {
//     await _flutterLocalNotificationsPlugin.cancelAll();
//   }
// }
