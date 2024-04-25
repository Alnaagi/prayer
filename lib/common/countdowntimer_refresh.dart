import 'dart:async';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart' as intl;
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer/common/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/var/prayer_calculation_method.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/var.dart';
import 'package:flutter/material.dart';

import 'package:prayers_times/prayers_times.dart';

bool MidnightActive = false;
bool middiffActive = false;
bool differenceActive = false;
bool isFetchingData2 = false;

class CountTimerPrayer extends StatefulWidget {
  const CountTimerPrayer({super.key});

  @override
  _CountTimerPrayerState createState() => _CountTimerPrayerState();
}

// bool isFetchingData2 = false;
// bool differenceActive = false;
// bool MidnightActive = false;
// bool middiffActive = false;
// bool midswitch = false;

class _CountTimerPrayerState extends State<CountTimerPrayer> {
  @override
  Widget build(BuildContext context) {
    Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);

// Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.custom();
    params.madhab = PrayerMadhab.shafi;
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
    intl.DateFormat format2 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime PrayerCurrentTime = format2.parse(Currentprayer);

    testtimecurrent = PrayerCurrentTime;
    // print(PrayerCurrentTime);
    // print(Currentprayer);

    final timenowago = DateTime.now();
    final difference = timenowago.difference(PrayerCurrentTime);

///////////////////////////////////
//////////// Next prayer ////////// بقي
    String Nextprayer =
        "${now.year}-${now.month}-${now.day + 1} ${prayerTimes1.timeForPrayer(next)}:00.000";
    intl.DateFormat format3 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime PrayerNextTime = format3.parse(Nextprayer);

    final timenowafter = DateTime.now();
    final afterdifference = PrayerNextTime.difference(timenowafter);

////////////////////////////////
//////// if after midnight /////  مضى امس
    String yesterdayprayer =
        "${now.year}-${now.month}-${now.day - 1} ${prayerTimes.timeForPrayer(current)}:00.000";
    intl.DateFormat format4 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime yesterdayPrayer = format4.parse(yesterdayprayer);

    final nowww = DateTime.now();
    final Beforemidnight = nowww.difference(yesterdayPrayer);

    ////////////////////////////////
//////// if after midnight to fajr /////  بقي غدا
    String tomorrowprayer =
        "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(next)}:00.000";
    intl.DateFormat format5 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime tomorrowPrayer = format5.parse(tomorrowprayer);

    final nowwww = DateTime.now();
    final Aftermidnight = tomorrowPrayer.difference(nowwww);

    String tomorrowprayer2 =
        "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
    intl.DateFormat format6 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime tomorrowPrayer2 = format6.parse(tomorrowprayer2);

    // final nowwww2 = DateTime.now();
    // final Aftermidnight2 = DateTime.now()
    //     .subtract(Duration(days: nowwww2.day, hours: PrayerNextTime.hour));

    final nowwww2 = DateTime.now();
    final Aftermidnight2 = DateTime(nowwww.year, now.month, now.day,
            nowwww2.hour, nowwww2.minute, now.second)
        .subtract(Duration(
            hours: prayerTimes.asrEndTime!.minute,
            minutes: prayerTimes.asrEndTime!.minute));
///////////////////////////////////
//////////// current prayer2 /////// مضى
    String Currentprayer2 =
        "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
    intl.DateFormat format8 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime PrayerCurrentTime22 = format8.parse(Currentprayer2);

    final timenowago2 = DateTime.now();
    final difference2 = PrayerCurrentTime22.difference(timenowago2);

///////////////////////////////////
//////////// Next prayer2 ////////// بقي
    String Nextprayer2 =
        "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(next)}:00.000";
    intl.DateFormat format9 = intl.DateFormat('yyyy-MM-dd hh:mm');
    DateTime PrayerNextTime2 = format9.parse(Nextprayer2);

    final timenowafter2 = DateTime.now();
    final afterdifference2 = PrayerNextTime.difference(timenowafter2);

    // final test = nowwww2.difference();

    String durationToString(int minutes) {
      var d = Duration(
        seconds: minutes,
      );
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${parts[2].padLeft(2, '0')}';
    }

    print('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    print(
        "${durationToString(difference.inSeconds).substring(0, 8)} difference");
    print(
        "${durationToString(afterdifference.inSeconds).substring(0, 8)} afterdifference");
    print(
        "${durationToString(Beforemidnight.inSeconds).substring(0, 8)} Beforemidnight");
    print(
        "${durationToString(Aftermidnight.inSeconds).substring(1, 9)} Aftermidnight");
    print('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');

    print(durationToString(difference.inSeconds));
    print(durationToString(afterdifference.inSeconds));
    print(durationToString(Beforemidnight.inSeconds));
    print(durationToString(Aftermidnight.inSeconds));

    // print("difference${difference.inMinutes}");
    // print("afterdifference${afterdifference.inMinutes}");
    // print("Beforemidnight${Beforemidnight.inMinutes}");
    // print("Aftermidnight${Aftermidnight.inMinutes}");
    // print("Current*******${difference2.inMinutes}");
    // print("Next*******${test}");
    // print("Next*******${PrayerNextTime2}");
    // print("Next*******${difference2}");

////////////////////////////////////////////////////////////////////////

    if (Aftermidnight.inDays >= Beforemidnight.inDays) {
      MidnightActive = true;
      middiffActive = false;

      // print(
      //     "${durationToString(Aftermidnight.inSeconds)} بقي علي صلاة ${next} ");
    } else if (difference.inMinutes <= Aftermidnight.inMinutes) {
      // print("${Aftermidnight.inSeconds} مضى علي ***صلاة ${current} ");
      MidnightActive = false;
      differenceActive = true;
    } else if (Aftermidnight.inMinutes <= difference.inMinutes &&
        Beforemidnight.inMinutes <= afterdifference.inMinutes) {
      // print("${durationToString(Aftermidnight.inSeconds)}بقي sunshine ");
      MidnightActive = true;
      differenceActive = true;
    } else if (Aftermidnight.inMinutes >= difference.inMinutes) {
      // print("${durationToString(difference.inSeconds)}مضى ***");
      MidnightActive = false;
      middiffActive = false;
      differenceActive = true;
    } else if (afterdifference.inMinutes >= Beforemidnight.inMinutes &&
        difference.inMinutes <= afterdifference.inMinutes) {
      // print("${durationToString(Aftermidnight.inSeconds)}مضى *****aaa*****");
      MidnightActive = false;
      middiffActive = false;
      differenceActive = true;
    } else if (difference.inMinutes <= Aftermidnight.inMinutes &&
        afterdifference.inMinutes >= Beforemidnight.inMinutes) {
      MidnightActive = true;
      middiffActive = false;
      // differenceActive = true;
      // print("finish0");
    } else if (afterdifference.inDays >= Beforemidnight.inDays) {
      MidnightActive = true;
      middiffActive = false;

      print(now.hour);
      // print("finish1");
    } else {
      MidnightActive = false;
      differenceActive = true;
    }

    // print(PrayerNextTime);
    // print(PrayerCurrentTime);

    var format = HijriCalendar.now();
    var media = MediaQuery.of(context).size;
    // print(_format.toFormat("mm dd yy")); //09 14 39
    return isFetchingData2
        ? const CircularProgressIndicator()
        : InkWell(
            onTap: () {
              // MidnightActive = !MidnightActive;
              // if (MidnightActive == true) setState(() {});
              // if (differenceActive == true) {}
              // setState(() {});
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(Icons.location_on_outlined),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      height: media.height / 20,
                      child: TextButton.icon(
                        onPressed: () async {
                          await Permission.location.request();
                        },
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black54,
                        ),
                        label: Text(
                          "$locationName-$locationName2-$locationName3",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: media.height / 50),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      MidnightActive
                          ? SizedBox(
                              child: middiffActive
                                  ? Column(
                                      children: [
                                        Text(
                                          "${LocalData.passed.getString(context)} ${current.getString(context)}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          durationToString(
                                                  Beforemidnight.inSeconds)
                                              .substring(1, 9),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 50,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          "${LocalData.remaining.getString(context)} ${next.getString(context)}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: media.height / 30,
                                              height: media.height * 0.0011),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            durationToString(
                                                    Aftermidnight.inSeconds)
                                                .substring(0, 8),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: media.height / 16,
                                                height: media.height * 0.0010),
                                          ),
                                        ),
                                      ],
                                    ),
                            )
                          : SizedBox(
                              child: differenceActive
                                  ? Column(
                                      children: [
                                        Text(
                                          "${LocalData.passed.getString(context)} ${current.getString(context)}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: media.height / 30,
                                              height: media.height * 0.0011),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            durationToString(
                                                    difference.inSeconds)
                                                .substring(0, 8),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: media.height / 16,
                                                height: media.height * 0.0010),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          "${LocalData.remaining.getString(context)} ${next.getString(context)}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          durationToString(
                                                  afterdifference.inSeconds)
                                              .substring(0, 8),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                    ],
                  ),
                  Text(
                    format.fullDate(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: media.width * 0.05,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
  }

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
        // print('Error fetching data: $error');
      }
    });
  }

  Future<void> _fetchData() async {
    // Your code to fetch data asynchronously (e.g., using a network call)
    // ...
    // Update state variables based on fetched data (if applicable)
    // ...
  }
}
