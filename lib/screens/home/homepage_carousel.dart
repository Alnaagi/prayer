import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prayer/screens/home/homepage_left.dart';
import 'package:prayer/screens/home/homepage_middle.dart';
import 'package:prayer/screens/home/homepage_right.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 1;

  List<Widget> pageList = [
    const HomePageleft(),
    const HomePageCopy(),
    const HomePageRight(),
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(children: [
      CarouselSlider(
        items: pageList,
        carouselController: _controller,
        options: CarouselOptions(
            enableInfiniteScroll: false,
            // enlargeCenterPage: true,
            height: media.height * 0.867,
            // aspectRatio: media.width / media.height * 1.15,
            viewportFraction: 1,
            initialPage: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: pageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
