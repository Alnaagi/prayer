double latitudeloc = 32.8877;
double longitudeloc = 13.1872;
String timeZone = "Africa/Tripoli";
String locationName = "";
String locationName1 = "";
String locationName2 = "";
String locationName3 = "";
String locationName4 = "";
bool isFetchingData = false;
// late Duration Beforemidnight2;
// late Duration afterdifference;
bool isFetchingData2 = false;
bool isFetchingData3 = false;
String test = "";
bool changetimer = false;
bool differenceActive = false;
bool MidnightActive = false;
bool middiffActive = false;
bool midswitch = false;
var headingtest;

// print("$latitude,$longitude");
// Define the geographical coordinates for the location


// ///////////////////////////////////
// //////////// current prayer ///////
// String Currentprayer =
//     "${now.year}-${now.month}-${now.day} ${prayerTimes.timeForPrayer(current)}:00.000";
// intl.DateFormat format2 = new intl.DateFormat('yyyy-MM-dd hh:mm');
// DateTime PrayerCurrentTime = format2.parse(Currentprayer);

// final timenowago = DateTime.now();
// final difference = PrayerCurrentTime.difference(timenowago);

// ///////////////////////////////////
// //////////// Next prayer //////////
// String Nextprayer =
//     "${now.year}-${now.month}-${now.day} ${prayerTimes1.timeForPrayer(next)}:00.000";
// intl.DateFormat format3 = new intl.DateFormat('yyyy-MM-dd hh:mm');
// DateTime PrayerNextTime = format3.parse(Nextprayer);

// final timenowafter = DateTime.now();
// final afterdifference = PrayerNextTime.difference(timenowafter);

// ////////////////////////////////
// //////// if after midnight /////
// String yesterdayprayer =
//     "${now.year}-${now.month}-${now.day - 1} ${prayerTimes1.timeForPrayer(current)}:00.000";
// intl.DateFormat format4 = new intl.DateFormat('yyyy-MM-dd hh:mm');
// DateTime yesterday_prayer = format3.parse(yesterdayprayer);

// final nowww = DateTime.now();
// final Beforemidnight2 = now.difference(yesterday_prayer);

// String durationToString(int minutes) {
//   var d = Duration(
//     seconds: minutes,
//   );
//   List<String> parts = d.toString().split(':');
//   return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${parts[2].padLeft(2, '0')}';
// }

//     // print(durationToString(difference.inMinutes)); 
//     // print(durationToString(afterdifference.inMinutes));
//     // print(durationToString(Beforemidnight.inMinutes));

   