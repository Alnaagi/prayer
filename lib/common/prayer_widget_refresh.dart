import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

int time = 0;
Timer? timer;
Timer? timer2;
bool mainpage2 = false;

class PrayerWidget extends StatefulWidget {
  const PrayerWidget({
    super.key,
  });

  @override
  State<PrayerWidget> createState() => _PrayerWidgetState();
}

class _PrayerWidgetState extends State<PrayerWidget> {
  void initState() {
    _homepagerefresh();
    _timercanceler();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    timer?.cancel();
    timer2?.cancel();
  }

  bool aftertext = false;
  // bool changetimer = false;

  void _homepagerefresh() {
    // Location stream for continuous updates (if available)
    timer = Timer.periodic(Duration(milliseconds: 100), (_) async {
      print("Refresh///////");

      if (mounted) {
        setState(() {
          mainpage2 = false;
          timer?.cancel();
        });
      }
    });
  }

  void _timercanceler() async {
    timer2 = Timer.periodic(Duration(seconds: 5), (_) async {
      if (mounted) {
        setState(() {
          mainpage2 = false;
          print("Canceled///////");
          // timer2?.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _format = HijriCalendar.now();
    print(_format.fullDate()); //Thulatha, Ramadan 14, 1439 h
    print(_format.toFormat("mm dd yy")); //09 14 39
    // while (time <= 500) {
    //   print("object");
    //   setState(() {
    //     time++;
    //     print("object");
    //   });
    // }

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

    // final now = DateTime.now();
    // DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    // PrayerTimes prayerTimes1 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow,
    //   precision: true,
    //   locationName: timeZone,
    // );

// Display convenience utilities for prayer times
    // String current = prayerTimes.currentPrayer();
    // String next = prayerTimes.nextPrayer();
    // print(prayerTimes.timeForPrayer(current));

    // String Test555 = prayerTimes.timeForPrayer(current).toString();
    // print("$Test555/test");
    // DateTime testtime = DateTime.parse(Test555);
    // print(testtime);

    // print("$latitude,$longitude");
    // Define the geographical coordinates for the location
    // Coordinates(latitudeloc, longitudeloc);
    // print(latitudeloc);
    // print(longitudeloc);
    // print(timeZone);
    // // Specify the calculation parameters for prayer times
    // PrayerCalculationParameters params = PrayerCalculationMethod.custom();
    // params.madhab = PrayerMadhab.shafi;

    // // Create a PrayerTimes instance for the specified location
    // PrayerTimes prayerTimes = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   precision: true,
    //   locationName: timeZone,
    // );

    // final now = DateTime.now();
    // DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    // PrayerTimes prayerTimes1 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow,
    //   precision: true,
    //   locationName: timeZone,
    // );

    // // Display convenience utilities for prayer times
    // String current = prayerTimes.currentPrayer();
    // String next = prayerTimes.nextPrayer();

    bool isha_ActiveColor = false;
    bool maghrib_ActiveColor = false;
    bool asr_ActiveColor = false;
    bool dhuhr_ActiveColor = false;
    bool sunrise_ActiveColor = false;
    bool fajr_ActiveColor = false;

    // if prayer time is now the function will output
    DateTime date = DateTime.now();
    if (date.isAfter(prayerTimes.ishaStartTime!)) {
      // print("isha");
      isha_ActiveColor = !isha_ActiveColor;
    } else if (date.isAfter(prayerTimes.maghribStartTime!)) {
      // print("maghrib");
      maghrib_ActiveColor = !maghrib_ActiveColor;
    } else if (date.isAfter(prayerTimes.asrStartTime!)) {
      // print("asr");
      asr_ActiveColor = !asr_ActiveColor;
    } else if (date.isAfter(prayerTimes.dhuhrStartTime!)) {
      // print("dhuhr");
      dhuhr_ActiveColor = !dhuhr_ActiveColor;
    } else if (date.isAfter(prayerTimes.sunrise!)) {
      // print("sunrise");
      sunrise_ActiveColor = !sunrise_ActiveColor;
    } else if (date.isAfter(prayerTimes.fajrStartTime!)) {
      // print("fajr");
      fajr_ActiveColor = !fajr_ActiveColor;
    } else if (date.isAfter(prayerTimes.ishaEndTime!)) {
      // print("isha");
      isha_ActiveColor = false;
    }
    //media size
    List listArr = [
      {
        "Name": '\tالفجر',
        "Time": "${prayerTimes.fajrStartTime!}",
        "activeColor": fajr_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": '\tالشروق',
        "Time": "\t${prayerTimes.sunrise!}",
        "activeColor": sunrise_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": '\tالظهر',
        "Time": "\t${prayerTimes.dhuhrStartTime!}",
        "activeColor": dhuhr_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": '\tالعصر',
        "Time": "\t${prayerTimes.asrStartTime!}",
        "activeColor": asr_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": '\tالمغرب',
        "Time": "\t${prayerTimes.maghribStartTime!}",
        "activeColor": maghrib_ActiveColor ? Colors.amber : Colors.white70,
      },
      {
        "Name": '\tالعشاء',
        "Time": "\t${prayerTimes.ishaStartTime!}",
        "activeColor": isha_ActiveColor ? Colors.amber : Colors.white70,
      },
    ];

    var media = MediaQuery.of(context).size;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 12),
      shrinkWrap: true,
      itemCount: listArr.length,
      itemBuilder: (context, index) {
        var obj = listArr[index] as Map? ?? {};
        // return
        //  PrayerWidget(obj: obj);
        return PrayerWidget2(obj: obj);
      },
    );
  }
}

class PrayerWidget2 extends StatelessWidget {
  const PrayerWidget2({super.key, required this.obj});
  final Map obj;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            height: media.height * 0.088,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // border:
              //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

              boxShadow: [
                BoxShadow(
                    blurRadius: 0,
                    color: obj["activeColor"],
                    spreadRadius: 5,
                    offset: Offset(2, 4))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    obj["Time"],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    obj["Name"],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
