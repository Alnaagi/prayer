import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/next_date.dart';

import 'package:prayer/common/prayer_widget_refresh.dart';

import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

int time = 0;
Timer? timer;
Timer? timer2;
bool mainpage = false;

class HomePageRight extends StatefulWidget {
  const HomePageRight({super.key});

  @override
  State<HomePageRight> createState() => _HomePageRightState();
}

class _HomePageRightState extends State<HomePageRight> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    //media size
    List listArr = [
      {
        "Name": '\tالفجر',
        "Time": "${prayerTimes1.fajrStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": '\tالشروق',
        "Time": "\t${prayerTimes1.sunrise!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": '\tالظهر',
        "Time": "\t${prayerTimes1.dhuhrStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": '\tالعصر',
        "Time": "\t${prayerTimes1.asrStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": '\tالمغرب',
        "Time": "\t${prayerTimes1.maghribStartTime!}",
        "activeColor": Colors.white70,
      },
      {
        "Name": '\tالعشاء',
        "Time": "\t${prayerTimes1.ishaStartTime!}",
        "activeColor": Colors.white70,
      },
    ];

    var media = MediaQuery.of(context).size;

    return mainpage
        ? CircularProgressIndicator()
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              height: media.height,
              width: media.width,
              // decoration: BoxDecoration(
              //   image: DecorationImage(image: logo, fit: BoxFit.fill),
              // ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: media.height * 0.06,
                    ),
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 4,
                            sigmaY: 4,
                          ),
                          child: Container(
                            height: media.height * .22,
                            width: media.width * .93,
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              borderRadius: BorderRadius.circular(15),
                              // border:
                              //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.white70,
                                    spreadRadius: 5,
                                    offset: Offset(2, 4))
                              ],
                            ),
                            child: Center(
                              child: NextDatePage(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shrinkWrap: true,
                      itemCount: listArr.length,
                      itemBuilder: (context, index) {
                        var obj = listArr[index] as Map? ?? {};
                        return PrayerWidget();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
