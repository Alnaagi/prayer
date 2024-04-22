import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/prayer_calculation_method.dart';

import 'package:prayers_times/prayers_times.dart';

int time = 0;
Timer? timer;
Timer? timer2;
// Timer? timerazan;
// bool mainpage2 = false;

class PrayerWidgetRight extends StatelessWidget {
  const PrayerWidgetRight({
    super.key,
  });

  // void initState() {
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
    // PrayerTimes prayerTimes = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   precision: true,
    //   locationName: timeZone,
    // );

    final now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    PrayerTimes prayerTimes1 = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      dateTime: tomorrow,
      precision: true,
      locationName: timeZone,
    );

    List listArr = [
      {
        "Name": LocalData.Fajr.getString(context),
        "Time": "${prayerTimes1.fajrStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": LocalData.sunrise.getString(context),
        "Time": "\t${prayerTimes1.sunrise!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": LocalData.Dhuhr.getString(context),
        "Time": "\t${prayerTimes1.dhuhrStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": LocalData.Asr.getString(context),
        "Time": "\t${prayerTimes1.asrStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": LocalData.Maghrib.getString(context),
        "Time": "\t${prayerTimes1.maghribStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": LocalData.Isha.getString(context),
        "Time": "\t${prayerTimes1.ishaStartTime!}",
        "activeColor": Colors.white70,
      },
    ];

    // var media = MediaQuery.of(context).size;

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
        return PrayerWidgetRight2(obj: obj);
      },
    );
  }
}

class PrayerWidgetRight2 extends StatelessWidget {
  const PrayerWidgetRight2({super.key, required this.obj});
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
