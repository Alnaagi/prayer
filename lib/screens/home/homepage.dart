import 'package:flutter/material.dart';
import 'package:prayers_times/prayers_times.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Define the geographical coordinates for the location
    Coordinates coordinates = Coordinates(32.87519, 13.18746);

    // Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.egyptian();
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
    int add_Fajrtime = 7;
    int add_Dhuhrtime = 7;
    int add_Asrtime = 7;
    int add_Maghribtime = 7;
    int add_Ishatime = 7;
    ImageProvider logo = const AssetImage("assets/images/hourburj.png");
    //media size
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: logo, fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: media.height * 0.08,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Current Prayer:\f$current\f${prayerTimes.timeForPrayer(current)}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.05,
                    ),
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Next Prayer:\f$next\f${prayerTimes.timeForPrayer(next)}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: media.height * 0.05,
                  ),
                  Container(
                    height: media.height * 0.1,
                    width: media.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\t${prayerTimes.fajrStartTime!}\t الفجر',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Container(
                    height: media.height * 0.1,
                    width: media.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\t${prayerTimes.fajrStartTime!}\t الشروق',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Container(
                    height: media.height * 0.1,
                    width: media.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\t${prayerTimes.dhuhrStartTime!}\t الظهر',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Container(
                    height: media.height * 0.1,
                    width: media.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\t${prayerTimes.asrStartTime!}\t العصر',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Container(
                    height: media.height * 0.1,
                    width: media.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\t${prayerTimes.maghribStartTime!}\t المغرب',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Container(
                    height: media.height * 0.1,
                    width: media.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\t${prayerTimes.ishaStartTime!}\t العشاء',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
