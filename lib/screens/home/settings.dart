import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer/common/add_prayer_time_page.dart';
import 'package:prayer/common/change_alert_time_for_prayer.dart';
import 'package:prayer/common/hijri_adj.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/var.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late FlutterLocalization _flutterLocalization;

  @override
  Widget build(BuildContext context) {
    _flutterLocalization = FlutterLocalization.instance;
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                LocalData.Settings.getString(context),
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                // textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.grey.shade50,
                          title: Center(
                              child: Text(
                            LocalData.Language.getString(context),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                          actions: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: LocalData.toast
                                                .getString(context));
                                        setState(() {
                                          Hijrilang = "en";

                                          updateHijriLang();
                                        });
                                        _flutterLocalization.translate("en");
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "English",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      )),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: LocalData.toast
                                                .getString(context));
                                        setState(() {
                                          Hijrilang = "ar";
                                          updateHijriLang();
                                        });
                                        _flutterLocalization.translate("ar");
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "العربية",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.Language.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () async {
                      await Permission.location.request();
                      try {
                        final position2 = await Geolocator.getCurrentPosition(
                            // timeLimit: Duration(seconds: 10),
                            desiredAccuracy: LocationAccuracy.best);
                        setState(() {
                          latitudeloc = position2.latitude;
                          longitudeloc = position2.longitude;

                          // _getTimeZoneFromLookupService_atlaunch();
                          // timer.cancel();
                          // _listenForLocationChanges(); // Call your location data processing function here
                        });
                      } catch (e) {
                        setState(() {
                          Fluttertoast.showToast(
                              msg: "Error getting location: $e");
                          print("Error getting location: $e");
                        });
                      }
                      Fluttertoast.showToast(
                          msg: LocalData.updating_location.getString(context));
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.Update_Location.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.grey.shade50,
                          title: Center(
                              child: Text(
                            LocalData.change_athan.getString(context),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                          actions: [
                            Column(
                              children: [
                                const Divider(
                                  color: Colors.black,
                                  thickness: 1.5,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.water.getString(context),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                      ),
                                    )),
                                // Container(
                                //   height: 50,
                                //   width: 1,
                                //   color: Colors.black,
                                // ),
                                const Divider(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.istigfar.getString(context),
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    )),
                                const Divider(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.Azan.getString(context),
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    )),
                                const Divider(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.igama.getString(context),
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.change_athan.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () async {
                      final AwesomeNotifications awesomeNotifications =
                          AwesomeNotifications();
                      List<NotificationModel> scheduledNotifications =
                          await awesomeNotifications
                              .listScheduledNotifications();
                      print(scheduledNotifications);
                      // setState(() {
                      //   notifbool = !notifbool;
                      // });
                      // if (notifbool == false) {
                      //   Fluttertoast.showToast(msg: "Notification Disabled");
                      // } else if (notifbool == true) {
                      //   Fluttertoast.showToast(msg: "Notification Enabled");
                      // }
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.disable_athan.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Add_prayer_time_page(),
                          ));
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.Add_time_to_prayers.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ChangeAlertTimeForPrayer(),
                          ));
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.change_alert_time_for_prayer
                            .getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HijriAdjPage(),
                          ));
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.Hijri_Date_diffrence.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Fluttertoast.showToast(msg: "Time Format has changed");
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.Time_12_24h.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateHijriLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("Hijrilang", Hijrilang);
    });
  }
}
