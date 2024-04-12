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

class Add_prayer_time_page extends StatefulWidget {
  Add_prayer_time_page({super.key});

  @override
  State<Add_prayer_time_page> createState() => _Add_prayer_time_pageState();
}

class _Add_prayer_time_pageState extends State<Add_prayer_time_page> {
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
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  LocalData.Add_time_to_prayers.getString(context),
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  // textDirection: TextDirection.rtl,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    fajr = fajr - 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Text(
                              "${prayerTimes.fajrStartTime!.hour.toString()}:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                // margin: const EdgeInsets.all(1),
                                width: media.width * 0.10,
                                height: media.height * 0.042,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38,
                                ),
                                child: AnimatedFlipCounter(
                                  value: prayerTimes.fajrStartTime!.minute,
                                  // Use "infix" to show a value between negative sign and number

                                  // Some languages like French use comma as decimal separator

                                  // padding: const EdgeInsets.all(0),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    fajr = fajr + 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "+",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                LocalData.Fajr.getString(context),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    fajr = fajr - 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Text(
                              "${prayerTimes.fajrStartTime!.hour.toString()}:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                // margin: const EdgeInsets.all(1),
                                width: media.width * 0.10,
                                height: media.height * 0.042,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38,
                                ),
                                child: AnimatedFlipCounter(
                                  value: prayerTimes.fajrStartTime!.minute,
                                  // Use "infix" to show a value between negative sign and number

                                  // Some languages like French use comma as decimal separator

                                  // padding: const EdgeInsets.all(0),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    fajr = fajr + 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "+",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                LocalData.Fajr.getString(context),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    fajr = fajr - 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Text(
                              "${prayerTimes.fajrStartTime!.hour.toString()}:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                // margin: const EdgeInsets.all(1),
                                width: media.width * 0.10,
                                height: media.height * 0.042,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38,
                                ),
                                child: AnimatedFlipCounter(
                                  value: prayerTimes.fajrStartTime!.minute,
                                  // Use "infix" to show a value between negative sign and number

                                  // Some languages like French use comma as decimal separator

                                  // padding: const EdgeInsets.all(0),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    fajr = fajr + 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "+",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                LocalData.Fajr.getString(context),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    fajr = fajr - 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Text(
                              "${prayerTimes.fajrStartTime!.hour.toString()}:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                // margin: const EdgeInsets.all(1),
                                width: media.width * 0.10,
                                height: media.height * 0.042,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38,
                                ),
                                child: AnimatedFlipCounter(
                                  value: prayerTimes.fajrStartTime!.minute,
                                  // Use "infix" to show a value between negative sign and number

                                  // Some languages like French use comma as decimal separator

                                  // padding: const EdgeInsets.all(0),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    fajr = fajr + 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "+",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                LocalData.Fajr.getString(context),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    fajr = fajr - 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Text(
                              "${prayerTimes.fajrStartTime!.hour.toString()}:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                // margin: const EdgeInsets.all(1),
                                width: media.width * 0.10,
                                height: media.height * 0.042,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38,
                                ),
                                child: AnimatedFlipCounter(
                                  value: prayerTimes.fajrStartTime!.minute,
                                  // Use "infix" to show a value between negative sign and number

                                  // Some languages like French use comma as decimal separator

                                  // padding: const EdgeInsets.all(0),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    fajr = fajr + 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "+",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                LocalData.Fajr.getString(context),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.8, vertical: 2),
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    fajr = fajr - 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Text(
                              "${prayerTimes.fajrStartTime!.hour.toString()}:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                // margin: const EdgeInsets.all(1),
                                width: media.width * 0.10,
                                height: media.height * 0.042,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38,
                                ),
                                child: AnimatedFlipCounter(
                                  value: prayerTimes.fajrStartTime!.minute,
                                  // Use "infix" to show a value between negative sign and number

                                  // Some languages like French use comma as decimal separator

                                  // padding: const EdgeInsets.all(0),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    fajr = fajr + 1;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "+",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                LocalData.Fajr.getString(context),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
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
