import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/localization/locales.dart';
import 'package:prayer/var/prayer_calculation_method.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

class Add_prayer_time_page extends StatefulWidget {
  const Add_prayer_time_page({super.key});

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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
                  padding: const EdgeInsets.only(bottom: 40),
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

                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white70,
                                  spreadRadius: 5,
                                  offset: Offset(2, 4))
                            ],
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      " - ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),

                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: const EdgeInsets.all(1),
                                  width: media.width * 0.22,
                                  height: media.height * 0.042,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black38,
                                  ),
                                  child: Center(
                                    child: Text(
                                      prayerTimes.fajrStartTime!.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      " + ",
                                      style: TextStyle(
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

                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white70,
                                  spreadRadius: 5,
                                  offset: Offset(2, 4))
                            ],
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      duhr = duhr - 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      " - ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),

                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: const EdgeInsets.all(1),
                                  width: media.width * 0.22,
                                  height: media.height * 0.042,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black38,
                                  ),
                                  child: Center(
                                    child: Text(
                                      prayerTimes.dhuhrStartTime!.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      duhr = duhr + 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      " + ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  LocalData.Dhuhr.getString(context),
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

                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white70,
                                  spreadRadius: 5,
                                  offset: Offset(2, 4))
                            ],
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      asr = asr - 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      " - ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),

                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: const EdgeInsets.all(1),
                                  width: media.width * 0.22,
                                  height: media.height * 0.042,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black38,
                                  ),
                                  child: Center(
                                    child: Text(
                                      prayerTimes.asrStartTime!.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      asr = asr + 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      " + ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  LocalData.Asr.getString(context),
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

                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white70,
                                  spreadRadius: 5,
                                  offset: Offset(2, 4))
                            ],
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      maghrib = maghrib - 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      " - ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),

                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: const EdgeInsets.all(1),
                                  width: media.width * 0.22,
                                  height: media.height * 0.042,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black38,
                                  ),
                                  child: Center(
                                    child: Text(
                                      prayerTimes.maghribStartTime!.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      maghrib = maghrib + 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      " + ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  LocalData.Maghrib.getString(context),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
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

                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white70,
                                  spreadRadius: 5,
                                  offset: Offset(2, 4))
                            ],
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      isha = isha - 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      " - ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),

                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  // margin: const EdgeInsets.all(1),
                                  width: media.width * 0.22,
                                  height: media.height * 0.042,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black38,
                                  ),
                                  child: Center(
                                    child: Text(
                                      prayerTimes.ishaStartTime!.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isha = isha + 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      " + ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  LocalData.Isha.getString(context),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.8, vertical: 50),
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

                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white70,
                                  spreadRadius: 5,
                                  offset: Offset(2, 4))
                            ],
                          ),
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Back",
                                  style: TextStyle(
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
      ),
    );
  }
}
