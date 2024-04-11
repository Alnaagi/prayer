// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:prayer/var/var.dart';

// class PrayerCurrent extends StatefulWidget {
//   const PrayerCurrent({super.key, required this.obj});
//   final Map obj;

//   @override
//   State<PrayerCurrent> createState() => _PrayerCurrentState();
// }

// class _PrayerCurrentState extends State<PrayerCurrent> {
//   Timer? _timer;

//   // Flag to indicate data fetching state
//   @override
//   void initState() {
//     _startTimer();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     const refreshDuration = Duration(seconds: 1);

//     _timer = Timer.periodic(refreshDuration, (_) async {
//       setState(() {
//         isFetchingData3 = true; // Show loading indicator
//       });
//       try {
//         await _fetchData(); // Fetch data asynchronously
//         setState(() {
//           isFetchingData3 = false; // Hide loading indicator
//         });
//       } catch (error) {
//         // Handle network errors gracefully (e.g., display an error message)
//         print('Error fetching data: $error');
//       }
//     });
//   }

//   Future<void> _fetchData() async {
//     // Your code to fetch data asynchronously (e.g., using a network call)
//     // ...
//     // Update state variables based on fetched data (if applicable)
//     // ...
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Error fetching data: ');
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: 4,
//           sigmaY: 4,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             // color: Colors.yellow,
//             borderRadius: BorderRadius.circular(15),
//             // border:
//             //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

//             boxShadow: const [
//               BoxShadow(
//                   blurRadius: 10,
//                   color: Colors.white70,
//                   spreadRadius: 5,
//                   offset: Offset(2, 4))
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   widget.obj["var"],
//                   style: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                   textDirection: TextDirection.rtl,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   widget.obj["CurrentPrayer"],
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                   textDirection: TextDirection.rtl,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   widget.obj["Time"],
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                   textDirection: TextDirection.rtl,
//                 ),
//               ),

//               // Align(
//               //   alignment: Alignment.center,
//               //   child: Padding(
//               //     padding: EdgeInsets.symmetric(
//               //       horizontal: 10,
//               //     ),
//               //     child: Text(
//               //       obj["benefit"],
//               //       style: TextStyle(
//               //           color: Colors.black54,
//               //           fontSize: 20,
//               //           fontWeight: FontWeight.bold),
//               //       textDirection: TextDirection.rtl,
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
