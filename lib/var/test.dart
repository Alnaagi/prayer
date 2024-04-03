// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AppointmentApp extends StatefulWidget {
//   @override
//   _AppointmentAppState createState() => _AppointmentAppState();
// }

// class Appointment {
//   late String title;
//   final DateTime time;
//   Duration? elapsedTime;

//   Appointment(this.title, this.time);
// }

// class _AppointmentAppState extends State<AppointmentApp> {
//   List<Appointment> appointments = [];
//   late Appointment currentAppointment;
//   late Appointment nextAppointment = appointments.first;
//   Duration remainingTime = Duration();
//   Duration? elapsedTime;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAppointments();
//     _setInitialAppointment();
//     _startTimer();
//   }

//   void _initializeAppointments() {
//     // Replace with your actual appointments and durations
//     appointments.add(Appointment('Meeting A', DateTime(2024, 4, 3, 9, 0)));
//     appointments.add(Appointment('Coffee Break',
//         DateTime(2024, 4, 3, 9, 10))); // 10 mins after Meeting A
//     appointments.add(Appointment('Lunch', DateTime(2024, 4, 3, 13, 0)));
//     appointments.add(Appointment('Meeting B', DateTime(2024, 4, 3, 13, 45)));
//     appointments.add(Appointment('Gym Session', DateTime(2024, 4, 3, 17, 0)));
//   }

//   void _setInitialAppointment() {
//     appointments.sort((a, b) => a.time.compareTo(b.time));
//     currentAppointment = appointments.firstWhere(
//       (appointment) => appointment.time.isAfter(DateTime.now()),
//       orElse: () => appointments.last,
//     );
//   }

//   void _startTimer() async {
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       // Calculate remaining time or elapsed time
//       if (currentAppointment.time.isAfter(DateTime.now())) {
//         remainingTime = currentAppointment.time.difference(DateTime.now());
//         currentAppointment.elapsedTime =
//             null; // Reset elapsedTime for upcoming appointments
//       } else {
//         elapsedTime = DateTime.now().difference(currentAppointment.time);
//       }

//       int currentIndex = appointments.indexOf(currentAppointment);

//       // Calculate total duration between current and next appointment
//       Duration totalDuration;
//       if (currentIndex < appointments.length - 1) {
//         totalDuration = appointments[currentIndex + 1]
//             .time
//             .difference(currentAppointment.time);
//       } else {
//         totalDuration =
//             appointments.first.time.difference(currentAppointment.time);
//       }

//       // Update UI based on remaining or elapsed time
//       setState(() {
//         if (remainingTime.inSeconds > 0) {
//           // Show remaining time until next appointment
//           nextAppointment =
//               appointments[appointments.indexOf(currentAppointment)];
//         } else {
//           // Show elapsed time and handle case where current appointment has passed
//           if (elapsedTime == null) return;
//           if (currentIndex < appointments.length - 1) {
//             currentAppointment = appointments[currentIndex + 1];
//             elapsedTime = null;
//           } else {
//             currentAppointment = appointments.first;
//             elapsedTime = null;
//           }
//           nextAppointment =
//               appointments[appointments.indexOf(currentAppointment)];
//         }

//         // Switch to next appointment at 50% mark
//         if (elapsedTime != null && elapsedTime! >= totalDuration ~/ 2) {
//           currentAppointment.title =
//               '${currentAppointment.title} (Time Has Passed)';
//           currentAppointment = nextAppointment;
//           elapsedTime = null;
//         }
//       });

//       if (remainingTime.inSeconds <= 0 && elapsedTime == null) {
//         timer.cancel();
//         _startTimer(); // Restart timer for next appointment
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointments'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               currentAppointment.title,
//               style: TextStyle(fontSize: 24),
//             ),
//             Text(
//               DateFormat('hh:mm a').format(currentAppointment.time),
//             ),
//             Text(
//               currentAppointment.elapsedTime == null
//                   ? remainingTime.inSeconds > 0
//                       ? '${remainingTime.inHours % 60} H ${remainingTime.inMinutes % 60} min ${remainingTime.inSeconds % 60} sec remaining'
//                       : 'Next Appointment: ${DateFormat('hh:mm a').format(nextAppointment.time)}'
//                   : '${elapsedTime!.inHours % 60} H ${elapsedTime!.inMinutes % 60} min elapsed',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
