import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prayers_times/prayers_times.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({super.key, required this.obj});
  final Map obj;
  @override
  Widget build(BuildContext context) {
    // Define the geographical coordinates for the location
    Coordinates coordinates =
        Coordinates(32.887210845947266, 13.191338539123535);

    // Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.custom();
    params.madhab = PrayerMadhab.shafi;

    // Create a PrayerTimes instance for the specified location
    PrayerTimes prayerTimes = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      precision: true,
      locationName: 'Africa/Tripoli',
    );

    final now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    PrayerTimes prayerTimes1 = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      dateTime: tomorrow,
      precision: true,
      locationName: 'Africa/Tripoli',
    );

    String current = prayerTimes.currentPrayer();
    String next = prayerTimes.nextPrayer();

    // DateTime currentPrayer() {
    // DateTime date = DateTime.now();
    // if (date.isAfter(current.)) {
    //   return DateTime.now();
    // }}

    // bool currentprayertime = false;
    // String dateString = prayerTimes.timeForPrayer(current).toString();
    // DateTime Testtime = DateTime.now();
    // DateTime Datenowtime = DateTime.now();
    // if (Datenowtime == Testtime) {
    //   currentprayertime = !currentprayertime;
    //   print("true");
    //   print(Datenowtime);
    // } else
    //   print("false");
    // print(Datenowtime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              // color: Colors.yellow,
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
                // Align(
                //   alignment: Alignment.center,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 10,
                //     ),
                //     child: Text(
                //       obj["benefit"],
                //       style: TextStyle(
                //           color: Colors.black54,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //       textDirection: TextDirection.rtl,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
