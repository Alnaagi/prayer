import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/var/prayer_calculation_method.dart';

import 'package:prayers_times/prayers_times.dart';

class HomePageleft extends StatelessWidget {
  const HomePageleft({super.key});

  @override
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

    // Determine and display Qibla direction
    double qiblaDirection = Qibla.qibla(coordinates);

    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: media.height / 3,
            ),
            InkWell(
              onTap: () {
                // _openAnimatedDialog(context);
                // setState(() {});
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Sunnah Times',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Middle of the Night:\t${sunnahInsights.middleOfTheNight}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Last Third of the Night:\t${sunnahInsights.lastThirdOfTheNight}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Qibla Direction:\t${(qiblaDirection).round()} degrees',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void _openAnimatedDialog(BuildContext context) {
//   showGeneralDialog(
//     barrierLabel: "",
//     barrierDismissible: true,
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return BackdropFilter(
//           filter: ImageFilter.blur(
//             sigmaX: 4,
//             sigmaY: 4,
//           ),
//           child: Container());
//     },
//     transitionDuration: const Duration(milliseconds: 250),
//     transitionBuilder: (context, a1, a2, child) {
//       return ScaleTransition(
//           scale: Tween(begin: 0.5, end: 1.0).animate(a1),
//           child: FadeTransition(
//             opacity: Tween(begin: 0.5, end: 1.0).animate(a1),
//             child: AlertDialog(
//               title: const Text("Hello"),
//               content: const Text("Hello"),
//               shape: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide.none),
//             ),
//           ));
//     },
//   );
// }
