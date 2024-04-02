import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:prayer/var/var.dart';
import 'package:flutter/material.dart';

import 'package:prayers_times/prayers_times.dart';

class CountTimerPrayer extends StatefulWidget {
  @override
  _CountTimerPrayerState createState() => _CountTimerPrayerState();
}

class _CountTimerPrayerState extends State<CountTimerPrayer> {
  Timer? _timer;
  // Flag to indicate data fetching state

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const refreshDuration = Duration(seconds: 1);

    _timer = Timer.periodic(refreshDuration, (_) async {
      setState(() {
        isFetchingData2 = true; // Show loading indicator
      });
      try {
        await _fetchData(); // Fetch data asynchronously
        setState(() {
          isFetchingData2 = false; // Hide loading indicator
        });
      } catch (error) {
        // Handle network errors gracefully (e.g., display an error message)
        print('Error fetching data: $error');
      }
    });
  }

  Future<void> _fetchData() async {
    // Your code to fetch data asynchronously (e.g., using a network call)
    // ...
    // Update state variables based on fetched data (if applicable)
    // ...
  }

  @override
  Widget build(BuildContext context) {
    Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);

// Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.custom();

// Create a PrayerTimes instance for the specified location
    PrayerTimes prayerTimes = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      precision: true,
      locationName: timeZone,
    );

    final now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    PrayerTimes prayerTimes1 = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      dateTime: tomorrow,
      precision: true,
      locationName: timeZone,
    );

// Display convenience utilities for prayer times
    String current = prayerTimes.currentPrayer();
    String next = prayerTimes.nextPrayer();

///////////////////////////////////
//////////// current prayer /////// مضى
    String Currentprayer =
        "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
    intl.DateFormat format2 = new intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime PrayerCurrentTime = format2.parse(Currentprayer);

    final timenowago = DateTime.now();
    final difference = PrayerCurrentTime.difference(timenowago);

///////////////////////////////////
//////////// Next prayer ////////// بقي
    String Nextprayer =
        "${now.year}-${now.month}-${now.day + 1} ${prayerTimes1.timeForPrayer(next)}:00.000";
    intl.DateFormat format3 = new intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime PrayerNextTime = format3.parse(Nextprayer);

    final timenowafter = DateTime.now();
    final afterdifference = PrayerNextTime.difference(timenowafter);

////////////////////////////////
//////// if after midnight /////  مضى امس
    String yesterdayprayer =
        "${now.year}-${now.month}-${now.day - 1} ${prayerTimes.timeForPrayer(current)}:00.000";
    intl.DateFormat format4 = new intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime yesterday_prayer = format4.parse(yesterdayprayer);

    final nowww = DateTime.now();
    final Beforemidnight = nowww.difference(yesterday_prayer);

    ////////////////////////////////
//////// if after midnight to fajr /////  بقي غدا
    String tomorrowprayer =
        "${now.year}-${now.month}-${now.day} ${prayerTimes1.timeForPrayer(next)}:00.000";
    intl.DateFormat format5 = new intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime tomorrow_prayer = format5.parse(tomorrowprayer);

    final nowwww = DateTime.now();
    final Aftermidnight = tomorrow_prayer.difference(nowwww);

    String durationToString(int minutes) {
      var d = Duration(
        seconds: minutes,
      );
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${parts[2].padLeft(2, '0')}';
    }

    print(durationToString(difference.inSeconds));
    print(durationToString(afterdifference.inSeconds));
    print(durationToString(Beforemidnight.inSeconds));
    print(durationToString(Aftermidnight.inSeconds));

    print("difference${difference.inMinutes}");
    print("afterdifference${afterdifference.inMinutes}");
    print("Beforemidnight${Beforemidnight.inMinutes}");
    print("Aftermidnight${Aftermidnight.inMinutes}");

////////////////////////////////////////////////////////////////////////

    if (difference.inMinutes <= Beforemidnight.inMinutes &&
        difference.inMinutes <= afterdifference.inMinutes) {
      print("${durationToString(difference.inMinutes)}مضى ");
      MidnightActive = false;
      differenceActive = true;
    } else if (difference >= afterdifference &&
        afterdifference.inMinutes >= Aftermidnight.inMinutes) {
      print("${afterdifference.inMinutes}بقي ");
      MidnightActive = false;
      differenceActive = false;
    } else if (Beforemidnight.inMinutes <= Aftermidnight.inMinutes &&
        Beforemidnight.inMinutes < difference.inMinutes) {
      print("${durationToString(Beforemidnight.inMinutes)}مضى ");
      MidnightActive = true;
      middiffActive = true;
    } else {
      print("${durationToString(Aftermidnight.inMinutes)}بقي ");
      MidnightActive = true;
      middiffActive = false;
    }

//////////////////////////////////////////////////////////////////////////
    return isFetchingData2
        ? CircularProgressIndicator()
        : InkWell(
            onTap: () {
              if (MidnightActive == true) setState(() {});
              if (differenceActive == true) {}
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.arrow_back_ios_rounded),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                            "${locationName}-${locationName2}-${locationName3}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),

                          // Text(locationName2),
                          // Text(locationName3),
                          // // Text(locationName4),
                          // // Text(timeZone),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        MidnightActive
                            ? Container(
                                child: middiffActive
                                    ? Column(
                                        children: [
                                          Text(
                                            "مضى على صلاة ${current}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            "${durationToString(Beforemidnight.inSeconds).substring(1, 8)}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 50,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                            "بقي على صلاة ${next}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            "${durationToString(Aftermidnight.inSeconds).substring(0, 8)}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                              )
                            : Container(
                                child: differenceActive
                                    ? Column(
                                        children: [
                                          Text(
                                            "مضى على صلاة ${current}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            "${durationToString(difference.inSeconds).substring(1, 8)}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 50,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                            "بقي على صلاة ${next}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            "${durationToString(afterdifference.inSeconds).substring(0, 8)}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                      ],
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          );
  }
}

// int difference = 1191;
// int Beforemidnight = 260;
// int afterdifference = 1706;
// int Aftermidnight = 250;

// String durationToString(int minutes) {
//   var d = Duration(
//     seconds: minutes,
//   );
//   List<String> parts = d.toString().split(':');
//   return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${parts[2].padLeft(2, '0')}';
// }

  //  if (difference.inMinutes <= Beforemidnight.inMinutes &&
  //       difference.inMinutes <= afterdifference.inMinutes) {
  //     print("${durationToString(difference.inSeconds)}مضى ");
  //     changetimer = true;
  //     return Column(
  //       children: [
  //         Text(
  //           "مضى على صلاة ${current}",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 25,
  //           ),
  //         ),
  //         Text(
  //           "${durationToString(difference.inSeconds).substring(1, 8)}",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 50,
  //           ),
  //         ),
  //       ],
  //     );
  //   } else if (difference.inMinutes >= afterdifference.inMinutes &&
  //       afterdifference.inMinutes >= Aftermidnight.inMinutes) {
  //     print("${durationToString(afterdifference.inSeconds)}بقي ");
  //     changetimer = false;
  //     return Column(
  //       children: [
  //         Text(
  //           "بقي على صلاة ${next}",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 25,
  //           ),
  //         ),
  //         Text(
  //           "${durationToString(afterdifference.inSeconds).substring(0, 8)}",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 50,
  //           ),
  //         ),
  //       ],
  //     );
  //   } else if (Beforemidnight <= Aftermidnight &&
  //       Beforemidnight.inMinutes < difference.inMinutes) {
  //     print("${durationToString(Beforemidnight.inSeconds)}مضى ");
  //   } else {
  //     print("${durationToString(Aftermidnight.inSeconds)}بقي ");
  //   }