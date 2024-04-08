DateTime testtimecurrent = DateTime.now();

bool isFetchingData3 = false;
String test = "";
bool changetimer = false;

var headingtest;




//media size

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

//media size

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



 // void initState() {
  //   // _homepagerefresh();
  //   // _timercanceler();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();

  //   timer?.cancel();
  //   timer2?.cancel();
  // }

  // bool aftertext = false;
  // // bool changetimer = false;

  // void _homepagerefresh() {
  //   // Location stream for continuous updates (if available)
  //   timer = Timer.periodic(Duration(milliseconds: 800), (_) async {
  //     print("Refresh///////");

  //     if (mounted) {
  //       setState(() {
  //         mainpage = false;
  //       });
  //     }
  //   });
  // }

  // void _timercanceler() async {
  //   timer2 = Timer.periodic(Duration(seconds: 10), (_) async {
  //     timer?.cancel();
  //     if (mounted) {
  //       setState(() {
  //         mainpage = false;
  //         print("Canceled///////");
  //       });
  //     }
  //   });
  // }



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



//     Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);

// // Specify the calculation parameters for prayer times
//     PrayerCalculationParameters params = PrayerCalculationMethod.custom();
//     params.madhab = PrayerMadhab.shafi;
// // Create a PrayerTimes instance for the specified location
//     PrayerTimes prayerTimes = PrayerTimes(
//       coordinates: coordinates,
//       calculationParameters: params,
//       precision: true,
//       locationName: timeZone,
//     );

//     // Display convenience utilities for prayer times
//     String current = prayerTimes.currentPrayer();
//     String next = prayerTimes.nextPrayer();

    // if prayer time is now the function will output
    // DateTime date = DateTime.now();
    // if (date.isAfter(prayerTimes.ishaStartTime!)) {
    //   // print("isha");
    //   isha_ActiveColor = !isha_ActiveColor;
    //   // AwesomeNotifications().createNotification(
    //   //     content: NotificationContent(
    //   //         id: 1,
    //   //         channelKey: "prayer_channel",
    //   //         title: "اذان صلاة العشاء",
    //   //         body: "حان الان الوقت لأذان صلاة العشاء"));
    // } else if (date.isAfter(prayerTimes.maghribStartTime!)) {
    //   // print("maghrib");
    //   maghrib_ActiveColor = !maghrib_ActiveColor;
    // } else if (date.isAfter(prayerTimes.asrStartTime!)) {
    //   // print("asr");
    //   asr_ActiveColor = !asr_ActiveColor;
    // } else if (date.isAfter(prayerTimes.dhuhrStartTime!)) {
    //   // print("dhuhr");
    //   dhuhr_ActiveColor = !dhuhr_ActiveColor;
    // } else if (date.isAfter(prayerTimes.sunrise!)) {
    //   // print("sunrise");
    //   sunrise_ActiveColor = !sunrise_ActiveColor;
    // } else if (date.isAfter(prayerTimes.fajrStartTime!)) {
    //   // print("fajr");
    //   fajr_ActiveColor = !fajr_ActiveColor;
    // } else if (date.isAfter(prayerTimes.ishaEndTime!)) {
    //   // print("isha");
    //   isha_ActiveColor = false;
    // }
