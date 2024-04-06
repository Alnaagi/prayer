import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:prayer/common/locationaddress.dart';

import 'package:prayer/common/prayer_widget_refresh.dart';
import 'package:prayer/common/countdowntimer_refresh.dart';

import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

var _today = HijriCalendar.now();
int time = 0;
Timer? timer;
Timer? timer2;
bool mainpage = false;

class HomePageCopy extends StatefulWidget {
  const HomePageCopy({super.key});

  @override
  State<HomePageCopy> createState() => _HomePageCopyState();
}

class _HomePageCopyState extends State<HomePageCopy> {
  @override
  void initState() {
    // _homepagerefresh();
    // _timercanceler();
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
    timer = Timer.periodic(Duration(milliseconds: 800), (_) async {
      print("Refresh///////");

      if (mounted) {
        setState(() {
          mainpage = false;
        });
      }
    });
  }

  void _timercanceler() async {
    timer2 = Timer.periodic(Duration(seconds: 10), (_) async {
      timer?.cancel();
      if (mounted) {
        setState(() {
          mainpage = false;
          print("Canceled///////");
        });
      }
    });
  }

  // List listArr = [
  //     {
  //       "Name": '\tالفجر',
  //       "Time": "${prayerTimes.fajrStartTime!}",
  //       "activeColor": fajr_ActiveColor ? Colors.amber : Colors.white70,
  //     },
  //     {
  //       "Name": '\tالشروق',
  //       "Time": "\t${prayerTimes.sunrise!}",
  //       "activeColor": sunrise_ActiveColor ? Colors.amber : Colors.white70,
  //     },
  //     {
  //       "Name": '\tالظهر',
  //       "Time": "\t${prayerTimes.dhuhrStartTime!}",
  //       "activeColor": dhuhr_ActiveColor ? Colors.amber : Colors.white70,
  //     },
  //     {
  //       "Name": '\tالعصر',
  //       "Time": "\t${prayerTimes.asrStartTime!}",
  //       "activeColor": asr_ActiveColor ? Colors.amber : Colors.white70,
  //     },
  //     {
  //       "Name": '\tالمغرب',
  //       "Time": "\t${prayerTimes.maghribStartTime!}",
  //       "activeColor": maghrib_ActiveColor ? Colors.amber : Colors.white70,
  //     },
  //     {
  //       "Name": '\tالعشاء',
  //       "Time": "\t${prayerTimes.ishaStartTime!}",
  //       "activeColor": isha_ActiveColor ? Colors.amber : Colors.white70,
  //     },
  //   ];
  @override
  Widget build(BuildContext context) {
    //media size

    setState(() {
      aftertext = false;
    });
    // //current PrayerTime
    // List listArrCurrent = [
    //   {
    //     "var": 'الآن',
    //     "CurrentPrayer": '\t$current',
    //     "Time": "\t${prayerTimes.timeForPrayer(current)}",
    //   },
    //   {
    //     "var": 'القادمة',
    //     "CurrentPrayer": '\t$next',
    //     "Time": "\t${prayerTimes.timeForPrayer(next)}",
    //   },
    // ];
    var media = MediaQuery.of(context).size;
// ///////////////////////////////////
// //////////// current prayer ///////
//     String Currentprayer =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
//     intl.DateFormat format2 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime PrayerCurrentTime = format2.parse(Currentprayer);
//     print(PrayerCurrentTime);

//     final timenowago = DateTime.now();
//     final difference = PrayerCurrentTime.difference(timenowago);
//     print(difference.inMinutes);
// ///////////////////////////////////
// //////////// Next prayer //////////
//     String Nextprayer =
//         "${now.year}-${now.month}-${now.day} ${prayerTimes1.timeForPrayer(next)}:00.000";
//     intl.DateFormat format3 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime PrayerNextTime = format3.parse(Nextprayer);
//     print(PrayerNextTime);

//     final timenowafter = DateTime.now();
//     final afterdifference = PrayerNextTime.difference(timenowafter);
//     print(afterdifference.inMinutes);
// ////////////////////////////////
// //////// if after midnight /////
//     String yesterdayprayer =
//         "${now.year}-${now.month}-${now.day - 1} ${prayerTimes1.timeForPrayer(current)}:00.000";
//     intl.DateFormat format4 = new intl.DateFormat('yyyy-MM-dd hh:mm');
//     DateTime yesterday_prayer = format3.parse(yesterdayprayer);
//     print(yesterday_prayer);

//     final nowww = DateTime.now();
//     final Beforemidnight2 = now.difference(yesterday_prayer);
//     print(Beforemidnight2.inMinutes);

//     String durationToString(int minutes) {
//       var d = Duration(
//         seconds: minutes,
//       );
//       List<String> parts = d.toString().split(':');
//       return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${parts[2].padLeft(2, '0')}';
//     }

    // print(durationToString(difference.inMinutes)); //returns 01:40
    // print(durationToString(afterdifference.inMinutes));
    // print(durationToString(Beforemidnight.inMinutes));

    // if (difference.inMinutes < afterdifference.inMinutes) {
    //   print(
    //       "مضى ${difference.inHours} ساعة و ${difference.inMinutes} دقيقة علي ${current}");
    //   ;
    // } else {
    //   print(
    //       " مضى امس ${Beforemidnight2.inHours} ساعة و ${Beforemidnight2.inMinutes - (Beforemidnight2.inHours * 60)} دقيقة علي ${current}");
    //   print(durationToString(Beforemidnight2.inSeconds));
    // }
    // test = durationToString(Beforemidnight2.inSeconds);

    // if (difference.inMinutes < afterdifference.inMinutes) {
    //   print(
    //       "بقي ${afterdifference.inHours} ساعة و ${afterdifference.inMinutes} دقيقة علي ${next} ");
    //   print(durationToString(afterdifference.inMinutes));
    // } else {
    //   print(
    //       "بقي ${afterdifference.inHours} ساعة و ${afterdifference.inMinutes - (afterdifference.inHours * 60)} دقيقة علي ${next} ");
    //   print(durationToString(afterdifference.inMinutes));
    // }

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
                      onTap: () {
                        setState(() {
                          changetimer = !changetimer;
                        });
                      },
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
                              child: CountTimerPrayer(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PrayerWidget(),
                  ],
                ),
              ),
            ),
          );
  }
}



// class CustomTimer extends StatefulWidget {
//   const CustomTimer({Key? key, endtime}) : super(key: key);

//   @override
//   State<CustomTimer> createState() => _CustomTimerState();
// }

// class _CustomTimerState extends State<CustomTimer> {
//   DateTime endtime = DateTime.now();
//   Timer? timer;
//   Duration remainTime = Duration();

//   newTime() {
//     // print('hi');
//     setState(() {
//       final seconds = remainTime.inSeconds + 1;
//       remainTime = Duration(seconds: seconds);
//     });
//   }

//   @override
//   void initState() {
//     remainTime = endtime.difference(DateTime.now());
//     timer = Timer.periodic(const Duration(seconds: 1), (_) => newTime());
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(remainTime.toString().split('.')[0].split('')[0] == '-'
//           ? "00:00:00"
//           : remainTime.toString().split('.')[0]),
//     );
//   }
// }


