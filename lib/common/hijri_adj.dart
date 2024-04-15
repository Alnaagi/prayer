import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:prayer/common/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/prayer_calculation_method.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

class HijriAdjPage extends StatefulWidget {
  HijriAdjPage({super.key});

  @override
  State<HijriAdjPage> createState() => _HijriAdjPageState();
}

class _HijriAdjPageState extends State<HijriAdjPage> {
  late FlutterLocalization _flutterLocalization;
  int selectedOption = hijritest;
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

    _flutterLocalization = FlutterLocalization.instance;
    ImageProvider logo = const AssetImage("assets/images/home1.jpg");
    var media = MediaQuery.of(context).size;

    // List options = ['0', '1', '2'];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: media.height,
        width: media.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: logo, fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  LocalData.Hijri_Date_diffrence.getString(context),
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  // textDirection: TextDirection.rtl,
                ),
              ),
              Text(
                HijriCalendar.now().fullDate(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4,
                      sigmaY: 4,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: media.height * 0.088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // border:
                          //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0,
                                color: Colors.white70,
                                spreadRadius: 5,
                                offset: const Offset(2, 4))
                          ],
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              activeColor: Colors.brown,
                              value: -2,
                              groupValue: hijritest,
                              onChanged: (value) {
                                setState(() {
                                  hijritest = value!;
                                });
                              },
                            ),
                            Text(
                              "-2",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Radio(
                              activeColor: Colors.brown,
                              value: -1,
                              groupValue: hijritest,
                              onChanged: (value) {
                                setState(() {
                                  hijritest = value!;
                                });
                              },
                            ),
                            Text(
                              "-1",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Radio(
                              activeColor: Colors.brown,
                              value: 0,
                              groupValue: hijritest,
                              onChanged: (value) {
                                setState(() {
                                  hijritest = value!;
                                });
                              },
                            ),
                            Text(
                              "0",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Radio(
                              activeColor: Colors.brown,
                              value: 1,
                              groupValue: hijritest,
                              onChanged: (value) {
                                setState(() {
                                  hijritest = value!;
                                });
                              },
                            ),
                            Text(
                              "+1",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Radio(
                              activeColor: Colors.brown,
                              value: 2,
                              groupValue: hijritest,
                              onChanged: (value) {
                                setState(() {
                                  hijritest = value!;
                                });
                              },
                            ),
                            Text(
                              "+2",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   prayerTimes.fajrStartTime!.toString(),
                            //   style: const TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 25,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4,
                      sigmaY: 4,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: media.height * 0.088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // border:
                          //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0,
                                color: Colors.white70,
                                spreadRadius: 5,
                                offset: const Offset(2, 4))
                          ],
                        ),
                        child: Center(
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Back",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
