import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:prayer/common/prayer_widget.dart';
import 'package:prayers_times/prayers_times.dart';

class HomePageCopy extends StatefulWidget {
  const HomePageCopy({super.key});

  @override
  State<HomePageCopy> createState() => _HomePageCopyState();
}

class _HomePageCopyState extends State<HomePageCopy> {
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

    // Display prayer times for the current date
    print('\n***** Prayer Times');
    print('Fajr Start Time:\t${prayerTimes.fajrStartTime!}');
    print('Fajr End Time:\t${prayerTimes.fajrEndTime!}');
    print('Sunrise Time:\t${prayerTimes.sunrise!}');
    print('Dhuhr Start Time:\t${prayerTimes.dhuhrStartTime!}');
    print('Dhuhr End Time:\t${prayerTimes.dhuhrEndTime!}');
    print('Asr Start Time:\t${prayerTimes.asrStartTime!}');
    print('Asr End Time:\t${prayerTimes.asrEndTime!}');
    print('Maghrib Start Time:\t${prayerTimes.maghribStartTime!}');
    print('Maghrib End Time:\t${prayerTimes.maghribEndTime!}');
    print('Isha Start Time:\t${prayerTimes.ishaStartTime!}');
    print('Isha End Time:\t${prayerTimes.ishaEndTime!}');
    print('Next Day Fajr Time:\t${prayerTimes1.fajrStartTime!}');
    print('Tahajjud End Time:\t${prayerTimes.tahajjudEndTime!}');
    print('Sehri End Time:\t${prayerTimes.sehri!}');

    // Display prayer times for the Tomorrow date
    print('\n***** Prayer Times');
    print('Fajr Start Time:\t${prayerTimes1.fajrStartTime!}');
    print('Fajr End Time:\t${prayerTimes1.fajrEndTime!}');
    print('Sunrise Time:\t${prayerTimes1.sunrise!}');
    print('Dhuhr Start Time:\t${prayerTimes1.dhuhrStartTime!}');
    print('Dhuhr End Time:\t${prayerTimes1.dhuhrEndTime!}');
    print('Asr Start Time:\t${prayerTimes1.asrStartTime!}');
    print('Asr End Time:\t${prayerTimes1.asrEndTime!}');
    print('Maghrib Start Time:\t${prayerTimes1.maghribStartTime!}');
    print('Maghrib End Time:\t${prayerTimes1.maghribEndTime!}');
    print('Isha Start Time:\t${prayerTimes1.ishaStartTime!}');
    print('Isha End Time:\t${prayerTimes1.ishaEndTime!}');
    print('Next Day Fajr Time:\t${prayerTimes1.fajrStartTime!}');
    print('Tahajjud End Time:\t${prayerTimes1.tahajjudEndTime!}');
    print('Sehri End Time:\t${prayerTimes1.sehri!}');

    // Display convenience utilities for prayer times
    String current = prayerTimes.currentPrayer();
    String next = prayerTimes.nextPrayer();

    // if (current == PrayerType.fajr) {
    //   PrayerType.fajr = "Fajr";
    // }
    print('\n***** Convenience Utilities');
    print('Current Prayer:\t$current\t${prayerTimes.timeForPrayer(current)}');
    print('Next Prayer:\t$next\t${prayerTimes.timeForPrayer(next)}');

    // Calculate and display Sunnah times
    SunnahInsights sunnahInsights = SunnahInsights(prayerTimes);
    print('\n***** Sunnah Times');
    print('Middle of the Night:\t${sunnahInsights.middleOfTheNight}');
    print('Last Third of the Night:\t${sunnahInsights.lastThirdOfTheNight}');

    // Determine and display Qibla direction
    print('\n***** Qibla Direction');
    double qiblaDirection = Qibla.qibla(coordinates);
    print('Qibla Direction:\t$qiblaDirection degrees');

// to add or subtract any difference or custom
    int addFajrtime = 7;
    int addDhuhrtime = 7;
    int addAsrtime = 7;
    int addMaghribtime = 7;
    int addIshatime = 7;
    ImageProvider logo = const AssetImage("assets/images/hourburj.png");

    bool isha_ActiveColor = false;
    bool maghrib_ActiveColor = false;
    bool asr_ActiveColor = false;
    bool dhuhr_ActiveColor = false;
    bool sunrise_ActiveColor = false;
    bool fajr_ActiveColor = false;

    // if prayer time is now the function will output
    DateTime date = DateTime.now();
    if (date.isAfter(prayerTimes.ishaStartTime!)) {
      print("isha");
      isha_ActiveColor = !isha_ActiveColor;
    } else if (date.isAfter(prayerTimes.maghribStartTime!)) {
      print("maghrib");
      maghrib_ActiveColor = !maghrib_ActiveColor;
    } else if (date.isAfter(prayerTimes.asrStartTime!)) {
      print("asr");
      asr_ActiveColor = !asr_ActiveColor;
    } else if (date.isAfter(prayerTimes.dhuhrStartTime!)) {
      print("dhuhr");
      dhuhr_ActiveColor = !dhuhr_ActiveColor;
    } else if (date.isAfter(prayerTimes.sunrise!)) {
      print("sunrise");
      sunrise_ActiveColor = !sunrise_ActiveColor;
    } else if (date.isAfter(prayerTimes.fajrStartTime!)) {
      print("fajr");
      fajr_ActiveColor = !fajr_ActiveColor;
    } else {
      print("isha");
      isha_ActiveColor = !isha_ActiveColor;
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

    //current PrayerTime
    List listArrCurrent = [
      {
        "var": 'الآن',
        "CurrentPrayer": '\t$current',
        "Time": "\t${prayerTimes.timeForPrayer(current)}",
      },
      {
        "var": 'القادمة',
        "CurrentPrayer": '\t$next',
        "Time": "\t${prayerTimes.timeForPrayer(next)}",
      },
    ];
    var media = MediaQuery.of(context).size;

    // var dt = DateTime.parse('2021-10-04 05:01:00.000Z');
    // print(dt.year);
    // print(dt.month);
    // print('${dt.hour}' + ":" + '${dt.minute}');
    // print(dt.minute);
    // print(dt.second);

    // String dateString =
    //     "'${DateTime.now().year.toString()}' +'${DateTime.now().month.toString()}' + '${DateTime.now().day.toString()}' + '20:48:52' ";

    // DateTime dateTime = format.parse(dateString);
    //  intl.DateFormat format = new intl.DateFormat.yMd();

    // print(dateTime);
    // print(DateTime.now().day);

    // String datetest = "2024-03-31 23:49:00.000";
    // intl.DateFormat format2 = new intl.DateFormat('yyyy-MM-dd hh:mm');
    // DateTime date2Time = format2.parse(datetest);
    // print(date2Time);

    // bool currentprayertime = false;
    // DateTime Testtime = DateTime.now();

    // DateTime Datenowtime = DateTime.now();
    // if (Datenowtime.isAfter(date2Time)) {
    //   currentprayertime = !currentprayertime;
    //   print(date2Time);
    //   print("true");
    // } else
    //   print("false");

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: media.height,
        width: media.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: logo, fit: BoxFit.fill),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.85,
                      // crossAxisSpacing: 1,
                      mainAxisSpacing: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: listArrCurrent.length,
                    itemBuilder: (context, index) {
                      var obj = listArrCurrent[index] as Map? ?? {};
                      return PrayerCurrent(obj: obj);
                    },
                  ),
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listArr.length,
              itemBuilder: (context, index) {
                var obj = listArr[index] as Map? ?? {};
                return PrayerWidget(obj: obj);
              },
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(image: logo, fit: BoxFit.fill),
    //     ),
    //     child: SafeArea(
    //       child: Center(
    //         child: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               SizedBox(
    //                 height: media.height * 0.08,
    //               ),
    //               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //                 Container(
    //                   width: 170,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15),
    //                     color: Colors.white,
    //                   ),
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(10.0),
    //                     child: Text(
    //                       '\f$current\f${prayerTimes.timeForPrayer(current)}',
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 20,
    //                         fontFamily: "Poppins",
    //                       ),
    //                       textAlign: TextAlign.end,
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: media.width * 0.05,
    //                 ),
    //                 Container(
    //                   width: 170,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15),
    //                     color: Colors.white,
    //                   ),
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(10.0),
    //                     child: Text(
    //                       'القادمة\f$next\f${prayerTimes.timeForPrayer(next)}',
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 20,
    //                         fontFamily: "Poppins",
    //                       ),
    //                       textAlign: TextAlign.end,
    //                     ),
    //                   ),
    //                 ),
    //               ]),
    //               SizedBox(
    //                 height: media.height * 0.05,
    //               ),
    //               Container(
    //                 height: media.height * 0.1,
    //                 width: media.width * .9,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: Colors.white,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     '\t${prayerTimes.fajrStartTime!}\t الفجر',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 20,
    //                       fontFamily: "Poppins",
    //                     ),
    //                     textAlign: TextAlign.end,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: media.height * 0.01,
    //               ),
    //               Container(
    //                 height: media.height * 0.1,
    //                 width: media.width * .9,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: Colors.white,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     '\t${prayerTimes.sunrise!}\t الشروق',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 20,
    //                       fontFamily: "Poppins",
    //                     ),
    //                     textAlign: TextAlign.end,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: media.height * 0.01,
    //               ),
    //               Container(
    //                 height: media.height * 0.1,
    //                 width: media.width * .9,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: Colors.white,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     '\t${prayerTimes.dhuhrStartTime!}\t الظهر',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 20,
    //                       fontFamily: "Poppins",
    //                     ),
    //                     textAlign: TextAlign.end,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: media.height * 0.01,
    //               ),
    //               Container(
    //                 height: media.height * 0.1,
    //                 width: media.width * .9,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: Colors.white,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     '\t${prayerTimes.asrStartTime!}\t العصر',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 20,
    //                       fontFamily: "Poppins",
    //                     ),
    //                     textAlign: TextAlign.end,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: media.height * 0.01,
    //               ),
    //               Container(
    //                 height: media.height * 0.1,
    //                 width: media.width * .9,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: Colors.white,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     '\t${prayerTimes.maghribStartTime!}\t المغرب',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 20,
    //                       fontFamily: "Poppins",
    //                     ),
    //                     textAlign: TextAlign.end,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: media.height * 0.01,
    //               ),
    //               Container(
    //                 height: media.height * 0.1,
    //                 width: media.width * .9,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: Colors.white,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     '\t${prayerTimes.ishaStartTime!}\t العشاء',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 20,
    //                       fontFamily: "Poppins",
    //                     ),
    //                     textAlign: TextAlign.end,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: media.height * 0.2,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class PrayerCurrent extends StatelessWidget {
  const PrayerCurrent({super.key, required this.obj});
  final Map obj;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  obj["var"],
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  obj["CurrentPrayer"],
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
                  obj["Time"],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
    );
  }
}
