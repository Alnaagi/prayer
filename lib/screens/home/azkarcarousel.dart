import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:prayer/screens/azkar/afternoon.dart';
import 'package:prayer/screens/azkar/afterprayer.dart';
import 'package:prayer/screens/azkar/morning.dart';

class AzkarCarousel extends StatefulWidget {
  const AzkarCarousel({
    super.key,
  });

  @override
  State<AzkarCarousel> createState() => _AzkarCarouselState();
}

class _AzkarCarouselState extends State<AzkarCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<Widget> imgList = [
    AfternoonPage(),
    MorningPage(),
    AfterPrayerPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = const AssetImage("assets/images/home1.jpg");
    var media = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        body: Container(
          height: media.height,
          width: media.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: logo, fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: media.height / 7.5,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: media.height,
                      child: TabBarView(
                        children: [
                          MorningPage(),
                          AfternoonPage(),
                          AfterPrayerPage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 13.5, vertical: 49.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      height: media.height * 0.1,
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
                      child: TabBar(
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                        indicatorColor: Colors.black,
                        tabs: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "أذكار الصباح",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: media.width * 0.048,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "أذكار المساء",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: media.width * 0.048,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Text(
                              "أذكار بعد الصلاة",
                              style: TextStyle(
                                  letterSpacing: 0.05,
                                  color: Colors.black87,
                                  fontSize: media.width * 0.045,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
