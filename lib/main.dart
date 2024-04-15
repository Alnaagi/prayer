import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:prayer/common/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/screens/home/home_bar.dart';
import 'package:prayer/var/var.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prayer/controller/test2.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.location.request();
  await Permission.notification.request();
  await AwesomeNotifications.localTimeZoneIdentifier;
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: lowVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_water',
        enableVibration: true,
        criticalAlerts: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group",
        channelKey: "Prayer_Water",
        channelName: "Prayer Water Remind",
        channelDescription: "Water sound for Prayer app"),
    NotificationChannel(
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: mediumVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_igama',
        enableVibration: true,
        criticalAlerts: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group",
        channelKey: "Prayer_igama",
        channelName: "Prayer istigfar Remind",
        channelDescription: "istigfar for Prayer app"),
    NotificationChannel(
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: mediumVibrationPattern,
        locked: true,
        soundSource: 'resource://raw/res_istigfar',
        enableVibration: true,
        playSound: true,
        criticalAlerts: true,
        channelGroupKey: "prayer_channel_group",
        channelKey: "Prayer_reminder",
        channelName: "Prayer istigfar Remind",
        channelDescription: "istigfar for Prayer app"),
    NotificationChannel(
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Public,
        // defaultRingtoneType: DefaultRingtoneType.Notification,
        defaultColor: Colors.transparent,
        vibrationPattern: highVibrationPattern,
        locked: true,
        criticalAlerts: true,
        soundSource: 'resource://raw/res_azan',
        enableVibration: true,
        playSound: true,
        channelGroupKey: "prayer_channel_group",
        channelKey: prayerchannelkey,
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
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configureLocalization();
    loadAlertPrayerTimeData();
    loadHijriData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: LocationAddress(),
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "ar");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  void loadAlertPrayerTimeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      fajrnotif_beforeprayertime =
          prefs.getInt("fajrnotif_beforeprayertime") ?? 5;
      duhrnotif_beforeprayertime =
          prefs.getInt("duhrnotif_beforeprayertime") ?? 5;
      asrnotif_beforeprayertime =
          prefs.getInt("asrnotif_beforeprayertime") ?? 5;
      maghribnotif_beforeprayertime =
          prefs.getInt("maghribnotif_beforeprayertime") ?? 5;
      ishanotif_beforeprayertime =
          prefs.getInt("ishanotif_beforeprayertime") ?? 5;

      fajrnotif_afterprayertime =
          prefs.getInt("fajrnotif_afterprayertime") ?? 10;
      duhrnotif_afterprayertime =
          prefs.getInt("duhrnotif_afterprayertime") ?? 10;
      asrnotif_afterprayertime = prefs.getInt("asrnotif_afterprayertime") ?? 10;
      maghribnotif_afterprayertime =
          prefs.getInt("maghribnotif_afterprayertime") ?? 10;
      ishanotif_afterprayertime =
          prefs.getInt("ishanotif_afterprayertime") ?? 10;
    });
  }

  void loadHijriData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Hijrilang = prefs.getString("Hijrilang") ?? "ar";
    });
  }

  // void hijri() {
  //   setState(() {});
  // }
}
