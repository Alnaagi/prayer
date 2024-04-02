import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

class HomePageRight extends StatefulWidget {
  const HomePageRight({super.key});

  @override
  State<HomePageRight> createState() => _HomePageRightState();
}

class _HomePageRightState extends State<HomePageRight> {
  Widget build(BuildContext context) {
    // Define the geographical coordinates for the location
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

    // Calculate and display Sunnah times
    SunnahInsights sunnahInsights = SunnahInsights(prayerTimes);
    print('\n***** Sunnah Times');
    print('Middle of the Night:\t${sunnahInsights.middleOfTheNight}');
    print('Last Third of the Night:\t${sunnahInsights.lastThirdOfTheNight}');

    // Determine and display Qibla direction
    print('\n***** Qibla Direction');
    double qiblaDirection = Qibla.qibla(coordinates);
    print('Qibla Direction:\t$qiblaDirection degrees');

    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: media.height / 3,
              ),
              InkWell(
                onTap: () {
                  setState(() {});
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sunnah Times'),
                          Text(
                              'Middle of the Night:\t${sunnahInsights.middleOfTheNight}'),
                          Text(
                              'Last Third of the Night:\t${sunnahInsights.lastThirdOfTheNight}'),
                          Text(
                              'Qibla Direction:\t${(qiblaDirection).round()} degrees'),
                        ],
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
