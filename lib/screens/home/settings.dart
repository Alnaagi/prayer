// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';

// DateTime scheduleTime = DateTime.now();

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var date = DateTime.now();
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.brown,
//       body: SafeArea(
//         child: Container(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemCount: 1,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');

//                                 AwesomeNotifications().createNotification(
//                                     content: NotificationContent(
//                                       id: 99,
//                                       channelKey: 'prayer_channel',
//                                       title: '   اذان صلاة ',
//                                       body: '   لأذان صلاة ',
//                                       wakeUpScreen: true,

//                                       // category: NotificationCategory.Reminder,
//                                       payload: {'uuid': 'uuid-test'},
//                                       // autoDismissible: false,
//                                     ),
//                                     schedule: NotificationCalendar.fromDate(
//                                         date: DateTime(
//                                             date.year,
//                                             date.month,
//                                             date.day,
//                                             date.hour,
//                                             date.minute,
//                                             date.second + 5),
//                                         preciseAlarm: true,
//                                         allowWhileIdle: true));
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Country List",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');

//                                 AwesomeNotifications().createNotification(
//                                     content: NotificationContent(
//                                       id: 88,
//                                       channelKey: 'Prayer_reminder',
//                                       title: "reminder",
//                                       body: 'reminder',
//                                       wakeUpScreen: true,

//                                       // category: NotificationCategory.Reminder,
//                                       payload: {'uuid': 'uuid-test'},
//                                       // autoDismissible: false,
//                                     ),
//                                     schedule: NotificationCalendar.fromDate(
//                                         date: DateTime(
//                                             date.year,
//                                             date.month,
//                                             date.day,
//                                             date.hour,
//                                             date.minute,
//                                             date.second + 5),
//                                         preciseAlarm: true,
//                                         allowWhileIdle: true));
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "City List",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');

//                                 AwesomeNotifications().createNotification(
//                                     content: NotificationContent(
//                                       id: 77,
//                                       channelKey: 'Prayer_igama',
//                                       title: "igama",
//                                       body: 'igama',
//                                       wakeUpScreen: true,

//                                       // category: NotificationCategory.Reminder,
//                                       payload: {'uuid': 'uuid-test'},
//                                       // autoDismissible: false,
//                                     ),
//                                     schedule: NotificationCalendar.fromDate(
//                                         date: DateTime(
//                                             date.year,
//                                             date.month,
//                                             date.day,
//                                             date.hour,
//                                             date.minute,
//                                             date.second + 5),
//                                         preciseAlarm: true,
//                                         allowWhileIdle: true));
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Add time to prayers ",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                                 AwesomeNotifications().createNotification(
//                                     content: NotificationContent(
//                                       id: 66,
//                                       channelKey: 'Prayer_Water',
//                                       title: "water",
//                                       body: 'water',
//                                       wakeUpScreen: true,

//                                       // category: NotificationCategory.Reminder,
//                                       payload: {'uuid': 'uuid-test2'},
//                                       // autoDismissible: false,
//                                     ),
//                                     schedule: NotificationCalendar.fromDate(
//                                         date: DateTime(
//                                             date.year,
//                                             date.month,
//                                             date.day,
//                                             date.hour,
//                                             date.minute,
//                                             date.second + 5),
//                                         preciseAlarm: true,
//                                         allowWhileIdle: true));
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Hijri Date diffrence",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                                 AwesomeNotifications().cancelAll();
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Language",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Time 12/24h",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "diable athan for a specific time",
//                                       style: TextStyle(fontSize: 18),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "change athan",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Update Location",
//                                       style: TextStyle(fontSize: 18),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Card(
//                             child: InkWell(
//                               onTap: () {
//                                 print('tapped');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "alert for prayer for each specific prayer time",
//                                       style: TextStyle(
//                                           fontSize: media.width * 0.04),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   )

//                   // ListView(
//                   //   children: [
//                   //     Text("Country List"),
//                   //     Text("diable athan for a specific time"),,
//                   //     Text("Add time to prayers "),
//                   //     Text("Language"),
//                   //     Text("Hijri Date diffrence"),
//                   //     Text("Time 12/24h"),
//                   //     Text("diable athan for a specific time"),
//                   //     Text("change athan"),
//                   //     Text("Update Location"),
//                   //     Text("alert for prayer for each specific prayer time"),
//                   //   ],
//                   // ),
//                   ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer/common/add_time_prayer.dart';
import 'package:prayer/common/add_prayer_time_page.dart';
import 'package:prayer/controller/test3.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/var.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({
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
    ImageProvider logo = const AssetImage("assets/images/test2.jpg");
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          showDialog(
                            useSafeArea: true,
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.grey.shade50,
                              title: Center(
                                  child: Text(
                                LocalData.Language.getString(context),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Fluttertoast.showToast(
                                          msg: LocalData.toast
                                              .getString(context));
                                      HijriCalendar.language = "en";
                                      _flutterLocalization.translate("en");
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "English",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
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
                                      HijriCalendar.language = "ar";
                                      _flutterLocalization.translate("ar");
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "العربية",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          LocalData.Language.getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () async {
                          await Permission.location.request();
                        },
                        child: Text(
                          LocalData.Update_Location.getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          showDialog(
                            useSafeArea: true,
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.grey.shade50,
                              title: Center(
                                  child: Text(
                                LocalData.change_athan.getString(context),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                              actions: [
                                Divider(
                                  color: Colors.black,
                                  thickness: 1.5,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.water.getString(context),
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                    )),
                                // Container(
                                //   height: 50,
                                //   width: 1,
                                //   color: Colors.black,
                                // ),
                                Divider(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.istigfar.getString(context),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    )),
                                Divider(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.Azan.getString(context),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    )),
                                Divider(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocalData.igama.getString(context),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    )),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          LocalData.change_athan.getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {},
                        child: Text(
                          LocalData.disable_athan.getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Add_prayer_time_page(),
                          ));
                    },
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: Text(
                        LocalData.Add_time_to_prayers.getString(context),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {},
                        child: Text(
                          LocalData.change_alert_time_for_prayer
                              .getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {},
                        child: Text(
                          LocalData.Hijri_Date_diffrence.getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
                    onTap: () {},
                    child: Container(
                      height: media.height * 0.088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border:
                        //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.white70,
                              spreadRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Time12_24page(),
                          //     ));
                        },
                        child: Text(
                          LocalData.Time_12_24h.getString(context),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          // textDirection: TextDirection.rtl,
                        ),
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
}




//   @override
//   Widget build(BuildContext context) {
//     //media size
//     List listArr = [
//       {
//         "Name": 'Language',
//         "activeColor": Colors.white70,
//         "ontap": null,
//       },
//       {
//         "Name": 'Hijri Date diffrence',
//         "activeColor": Colors.white70,
//         "ontap": null
//       },
//       {
//         "Name": 'Add time to prayers',
//         "activeColor": Colors.white70,
//         "ontap": null
//       },
//       {"Name": 'Time 12/24h', "activeColor": Colors.white70, "ontap": null},
//       {"Name": 'diable athan', "activeColor": Colors.white70, "ontap": null},
//       {"Name": 'change athan', "activeColor": Colors.white70, "ontap": null},
//       {"Name": 'Update Location', "activeColor": Colors.white70, "ontap": null},
//       {
//         "Name": 'change alert time for prayer',
//         "activeColor": Colors.white70,
//         "ontap": null
//       },
//     ];
//     var media = MediaQuery.of(context).size;
//     ImageProvider logo = const AssetImage("assets/images/test2.jpg");

//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Container(
//         height: media.height,
//         width: media.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: logo, fit: BoxFit.fill),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(
//                     top: 8,
//                   ),
//                   child: Text(
//                     "Settings",
//                     style: TextStyle(fontSize: 30, color: Colors.white70),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: media.height * 0.01,
//                 // ),
//                 ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   shrinkWrap: true,
//                   itemCount: listArr.length,
//                   itemBuilder: (context, index) {
//                     var obj = listArr[index] as Map? ?? {};

//                     // return
//                     //  PrayerWidget(obj: obj);
//                     return SettingsWidget(obj: obj);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SettingsWidget extends StatefulWidget {
//   const SettingsWidget({super.key, required this.obj});
//   final Map obj;

//   @override
//   State<SettingsWidget> createState() => _SettingsWidgetState();
// }

// class _SettingsWidgetState extends State<SettingsWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }