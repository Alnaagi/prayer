import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer/common/locationaddress.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: lowVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_water',
        enableVibration: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group4",
        channelKey: "Prayer_Water",
        channelName: "Prayer Water Remind",
        channelDescription: "Water sound for Prayer app"),
    NotificationChannel(
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: mediumVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_igama',
        enableVibration: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group3",
        channelKey: "Prayer_igama",
        channelName: "Prayer istigfar Remind",
        channelDescription: "istigfar for Prayer app"),
    NotificationChannel(
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: mediumVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_istigfar',
        enableVibration: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group2",
        channelKey: "Prayer_reminder",
        channelName: "Prayer istigfar Remind",
        channelDescription: "istigfar for Prayer app"),
    NotificationChannel(
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: highVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_azan',
        enableVibration: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group",
        channelKey: "prayer_channel",
        channelName: "Prayer Notif",
        channelDescription: "Testing Notif for Prayer app")
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "prayer_channel_group4",
        channelGroupName: "prayer Group4"),
    NotificationChannelGroup(
        channelGroupKey: "prayer_channel_group3",
        channelGroupName: "prayer Group3"),
    NotificationChannelGroup(
        channelGroupKey: "prayer_channel_group2",
        channelGroupName: "prayer Group2"),
    NotificationChannelGroup(
        channelGroupKey: "prayer_channel_group",
        channelGroupName: "prayer Group")
  ]);
  // bool isAllowedToSendNotifications =
  //     await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowedToSendNotifications) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // WidgetsFlutterBinding.ensureInitialized();
  // await LocalNotifications.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _getLocation() async {
    await Permission.location.request();
    await Permission.notification.request();

    // print(Permission.location.status);
    // print(Permission.notification.status);
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/sand.png"), context);
    precacheImage(const AssetImage("assets/images/rus4.png"), context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationAddress(),
    );
  }
}
