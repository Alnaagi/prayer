import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/prayer_calculation_method.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeAlertTimeForPrayer extends StatefulWidget {
  ChangeAlertTimeForPrayer({super.key});

  @override
  State<ChangeAlertTimeForPrayer> createState() =>
      _ChangeAlertTimeForPrayerState();
}

class _ChangeAlertTimeForPrayerState extends State<ChangeAlertTimeForPrayer> {
  late FlutterLocalization _flutterLocalization;

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  LocalData.change_alert_time_for_prayer.getString(context),
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  // textDirection: TextDirection.rtl,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        LocalData.afternotif.getString(context),
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Fajr.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                fajrnotif_afterprayertime =
                                                    fajrnotif_afterprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                fajrnotif_afterprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                fajrnotif_afterprayertime =
                                                    fajrnotif_afterprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Dhuhr.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                duhrnotif_afterprayertime =
                                                    duhrnotif_afterprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                duhrnotif_afterprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                duhrnotif_afterprayertime =
                                                    duhrnotif_afterprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Asr.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                asrnotif_afterprayertime =
                                                    asrnotif_afterprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                asrnotif_afterprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                asrnotif_afterprayertime =
                                                    asrnotif_afterprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Maghrib.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                maghribnotif_afterprayertime =
                                                    maghribnotif_afterprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                maghribnotif_afterprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                maghribnotif_afterprayertime =
                                                    maghribnotif_afterprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Isha.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                ishanotif_afterprayertime =
                                                    ishanotif_afterprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                ishanotif_afterprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                ishanotif_afterprayertime =
                                                    ishanotif_afterprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        LocalData.beforenotif.getString(context),
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        // textDirection: TextDirection.rtl,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Fajr.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                fajrnotif_beforeprayertime =
                                                    fajrnotif_beforeprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                fajrnotif_beforeprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                fajrnotif_beforeprayertime =
                                                    fajrnotif_beforeprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Dhuhr.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                duhrnotif_beforeprayertime =
                                                    duhrnotif_beforeprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                duhrnotif_beforeprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                duhrnotif_beforeprayertime =
                                                    duhrnotif_beforeprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Asr.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                asrnotif_beforeprayertime =
                                                    asrnotif_beforeprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                asrnotif_beforeprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                asrnotif_beforeprayertime =
                                                    asrnotif_beforeprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Maghrib.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                maghribnotif_beforeprayertime =
                                                    maghribnotif_beforeprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                maghribnotif_beforeprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                maghribnotif_beforeprayertime =
                                                    maghribnotif_beforeprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.8, vertical: 2),
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
                                width: media.width * 0.400,
                                height: media.height * 0.120,
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LocalData.Isha.getString(context),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   prayerTimes.fajrStartTime!.toString(),
                                        //   style: const TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                ishanotif_beforeprayertime =
                                                    ishanotif_beforeprayertime -
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " - ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),

                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: Container(
                                            // margin: const EdgeInsets.all(1),
                                            width: media.width * 0.15,
                                            height: media.height * 0.042,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black38,
                                            ),
                                            child: Center(
                                              child: Text(
                                                ishanotif_beforeprayertime
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                ishanotif_beforeprayertime =
                                                    ishanotif_beforeprayertime +
                                                        1;
                                                updateChangeAlertPrayerTime();
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                " + ",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 20),
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

  void updateChangeAlertPrayerTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt("fajrnotif_beforeprayertime", fajrnotif_beforeprayertime);
      prefs.setInt("duhrnotif_beforeprayertime", duhrnotif_beforeprayertime);
      prefs.setInt("asrnotif_beforeprayertime", asrnotif_beforeprayertime);
      prefs.setInt(
          "maghribnotif_beforeprayertime", maghribnotif_beforeprayertime);
      prefs.setInt("ishanotif_beforeprayertime", ishanotif_beforeprayertime);

      prefs.setInt("fajrnotif_afterprayertime", fajrnotif_afterprayertime);
      prefs.setInt("duhrnotif_afterprayertime", duhrnotif_afterprayertime);
      prefs.setInt("asrnotif_afterprayertime", asrnotif_afterprayertime);
      prefs.setInt(
          "maghribnotif_afterprayertime", maghribnotif_afterprayertime);
      prefs.setInt("ishanotif_afterprayertime", ishanotif_afterprayertime);
    });
  }
}
