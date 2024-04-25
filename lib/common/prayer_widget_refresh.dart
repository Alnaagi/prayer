import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/prayer_calculation_method.dart';

import 'package:prayers_times/prayers_times.dart';

// class Refreshgood {
//   static Future maingood() async {
//     mainpage2 = true;
//     print("goodr");
//   }
// }
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
                    offset: const Offset(2, 4))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  // alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      obj["Time"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      // textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Align(
                  //  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      obj["Name"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      // textDirection: TextDirection.rtl,
                    ),
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

class PrayerWidget extends StatefulWidget {
  const PrayerWidget({
    super.key,
  });

  @override
  State<PrayerWidget> createState() => _PrayerWidgetState();
}

class _PrayerWidgetState extends State<PrayerWidget> {
  int time = 0;
  Timer? timer;
  Timer? timer2;
  Timer? timerazan;
  bool mainpage2 = false;

  bool timera = false;

  // static Future testinggood() async {
  //   mainpage2 = false;
  //   print("good222");
  // }

  @override
  void initState() {
    // _homepagerefresh();
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
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      print("Refresh///////");

      if (mounted) {
        setState(() {
          mainpage2 = false;
          timer?.cancel();
          _timercanceler();
        });
      }
    });
  }

  void _timercanceler() async {
    timer2 = Timer.periodic(const Duration(seconds: 10), (timer2) async {
      if (mounted) {
        setState(() {
          mainpage2 = false;
          print("Canceled///////");
          // timer2.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var _format = HijriCalendar.now();
    // print(_format.fullDate()); //Thulatha, Ramadan 14, 1439 h
    // print(_format.toFormat("mm dd yy")); //09 14 39
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

    bool ishaActivecolor = false;
    bool maghribActivecolor = false;
    bool asrActivecolor = false;
    bool dhuhrActivecolor = false;
    bool sunriseActivecolor = false;
    bool fajrActivecolor = false;

    // if prayer time is now the function will output
    DateTime date = DateTime.now();
    if (date.isAfter(prayerTimes.ishaStartTime!)) {
      // print("isha");
      ishaActivecolor = !ishaActivecolor;
    } else if (date.isAfter(prayerTimes.maghribStartTime!)) {
      // print("maghrib");
      maghribActivecolor = !maghribActivecolor;
    } else if (date.isAfter(prayerTimes.asrStartTime!)) {
      // print("asr");
      asrActivecolor = !asrActivecolor;
    } else if (date.isAfter(prayerTimes.dhuhrStartTime!)) {
      // print("dhuhr");
      dhuhrActivecolor = !dhuhrActivecolor;
    } else if (date.isAfter(prayerTimes.sunrise!)) {
      // print("sunrise");
      sunriseActivecolor = !sunriseActivecolor;
    } else if (date.isAfter(prayerTimes.fajrStartTime!)) {
      // print("fajr");
      fajrActivecolor = !fajrActivecolor;
    } else if (date.isAfter(prayerTimes.ishaEndTime!)) {
      // print("isha");
      ishaActivecolor = false;
    }

    //media size
    List listArr = [
      {
        "Name": LocalData.Fajr.getString(context),
        "Time": "${prayerTimes.fajrStartTime!}",
        "activeColor": fajrActivecolor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.sunrise.getString(context),
        "Time": "\t${prayerTimes.sunrise!}",
        "activeColor": sunriseActivecolor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Dhuhr.getString(context),
        "Time": "\t${prayerTimes.dhuhrStartTime!}",
        "activeColor": dhuhrActivecolor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Asr.getString(context),
        "Time": "\t${prayerTimes.asrStartTime!}",
        "activeColor": asrActivecolor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Maghrib.getString(context),
        "Time": "\t${prayerTimes.maghribStartTime!}",
        "activeColor": maghribActivecolor ? Colors.amber : Colors.white70,
      },
      {
        "Name": LocalData.Isha.getString(context),
        "Time": "\t${prayerTimes.ishaStartTime!}",
        "activeColor": ishaActivecolor ? Colors.amber : Colors.white70,
      },
    ];

    // print("goodr65\\\\\\\999\6");
    var media = MediaQuery.of(context).size;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 12),
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
