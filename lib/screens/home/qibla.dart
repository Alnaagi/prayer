import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_compass_plus/utils/src/compass_ui.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool compcolor = false;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SmoothCompassWidget(
            rotationSpeed: 200,
            height: media.width / 1.18,
            isQiblahCompass: true,
            width: media.width / 1.18,
            compassBuilder: (context, AsyncSnapshot<CompassModel>? compassData,
                Widget compassAsset) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.height * 0.05,
                    ),
                    Image.asset(
                      "assets/images/landmark.png",
                      height: 150,
                    ),
                    SizedBox(
                      height: media.height * 0.05,
                    ),
                    AnimatedRotation(
                      turns: compassData?.data?.turns ?? 0 / 360,
                      duration: const Duration(milliseconds: 400),
                      child: SizedBox(
                        height: media.width / 1.18,
                        width: media.width / 1.18,
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 4,
                                        sigmaY: 4,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.yellow,
                                          // borderRadius: BorderRadius.circular(15),
                                          // border:
                                          //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: compcolor
                                                    ? Colors.black12
                                                    : Colors.white38,
                                                spreadRadius: 5,
                                                offset: const Offset(2, 4))
                                          ],
                                        ),
                                      ))),
                            ),
                            //put your compass here
                            Center(
                              child: SizedBox(
                                  height: media.width / 1.21,
                                  width: media.width / 1.21,
                                  child: Image.asset("assets/images/co.png",
                                      fit: BoxFit.fill)),
                            ),

                            //put your qiblah needle here
                            Positioned(
                              top: 35,
                              left: 0,
                              right: 0,
                              bottom: 35,
                              child: GestureDetector(
                                onTap: () {
                                  compcolor = !compcolor;
                                },
                                child: AnimatedRotation(
                                  turns:
                                      (compassData?.data?.qiblahOffset ?? 0) /
                                          360,
                                  duration: const Duration(milliseconds: 400),
                                  child: Image.asset(
                                    "assets/images/imageedit_15_5159350315.png",
                                    fit: BoxFit.fitHeight,
                                    // color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
