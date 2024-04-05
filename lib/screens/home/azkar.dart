// import 'package:flutter/material.dart';
// import 'package:prayer/screens/azkar/afternoon.dart';
// import 'package:prayer/screens/azkar/afterprayer.dart';
// import 'package:prayer/screens/azkar/morning.dart';

// class AzkarPage extends StatefulWidget {
//   const AzkarPage({super.key});

//   @override
//   State<AzkarPage> createState() => _AzkarPageState();
// }

// class _AzkarPageState extends State<AzkarPage> {
//   @override
//   Widget build(BuildContext context) {
//     ImageProvider logo = const AssetImage("assets/images/home4.jpg");
//     return DefaultTabController(
//         length: 3,
//         initialIndex: 2,
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: logo,
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: AppBar(
//               forceMaterialTransparency: true,
//               centerTitle: true,
//               shadowColor: Colors.black,
//               title: const Text(
//                 "الأذكار",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold),
//               ),
//               bottom: const TabBar(
//                 dividerColor: Colors.black87,
//                 dividerHeight: .8,
//                 indicatorColor: Colors.black87,
//                 indicatorWeight: 2,
//                 tabs: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     child: Text(
//                       "أذكار الصباح",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.normal),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     child: Text(
//                       "أذكار المساء",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.normal),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     child: Text(
//                       "أذكار بعد الصلاة",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17.2,
//                           fontWeight: FontWeight.normal),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               children: [
//                 MorningPage(),
//                 AfternoonPage(),
//                 AfterPrayerPage(),
//               ],
//             ),
//           ),
//         ));
//   }
// }
