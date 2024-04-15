// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:prayer/common/hijri_calendar.dart';
// import 'package:prayer/controller/test3.dart';
// import 'package:prayer/localization/locales.dart';
// import 'package:prayer/var/var.dart';

// class AddTimePrayerPage extends StatefulWidget {
//   AddTimePrayerPage({
//     super.key,
//   });

//   @override
//   State<AddTimePrayerPage> createState() => _AddTimePrayerPageState();
// }

// class _AddTimePrayerPageState extends State<AddTimePrayerPage> {
//   late FlutterLocalization _flutterLocalization;

//   @override
//   Widget build(BuildContext context) {
//     _flutterLocalization = FlutterLocalization.instance;
//     ImageProvider logo = const AssetImage("assets/images/test2.jpg");
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         height: media.height,
//         width: media.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: logo, fit: BoxFit.fill),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: Text(
//                   LocalData.Settings.getString(context),
//                   style: const TextStyle(
//                       color: Colors.white70,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold),
//                   // textDirection: TextDirection.rtl,
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(
//                       sigmaX: 4,
//                       sigmaY: 4,
//                     ),
//                     child: InkWell(
//                       onTap: () {},
//                       child: Container(
//                         height: media.height * 0.088,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           // border:
//                           //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

//                           boxShadow: [
//                             BoxShadow(
//                                 blurRadius: 0,
//                                 color: Colors.white70,
//                                 spreadRadius: 5,
//                                 offset: const Offset(2, 4))
//                           ],
//                         ),
//                         child: Center(
//                             child: TextButton(
//                           onPressed: () {
//                             showDialog(
//                               useSafeArea: true,
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 backgroundColor: Colors.grey.shade50,
//                                 title: Center(
//                                     child: Text(
//                                   LocalData.Language.getString(context),
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                                 actions: [
//                                   TextButton(
//                                       onPressed: () {
//                                         Fluttertoast.showToast(
//                                             msg: LocalData.toast
//                                                 .getString(context));
//                                         // HijriCalendar.language = "en";
//                                         _flutterLocalization.translate("en");
//                                         Navigator.pop(context);
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "English",
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.normal),
//                                         ),
//                                       )),
//                                   Container(
//                                     height: 50,
//                                     width: 1,
//                                     color: Colors.black,
//                                   ),
//                                   TextButton(
//                                       onPressed: () {
//                                         Fluttertoast.showToast(
//                                             msg: LocalData.toast
//                                                 .getString(context));
//                                         // HijriCalendar.language = "ar";
//                                         _flutterLocalization.translate("ar");
//                                         Navigator.pop(context);
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "العربية",
//                                           style: TextStyle(
//                                               fontSize: 30,
//                                               color: Colors.black),
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             );
//                           },
//                           child: Text(
//                             LocalData.Language.getString(context),
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold),
//                             // textDirection: TextDirection.rtl,
//                           ),
//                         )),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
