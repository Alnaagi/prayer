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
                    height: 85,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 42),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      height: 80,
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
                        indicatorColor: Colors.black,
                        tabs: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "أذكار الصباح",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "أذكار المساء",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "أذكار بعد الصلاة",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
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
