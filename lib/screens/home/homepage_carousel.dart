import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    HomePageCopy(),
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








// import 'package:flutter/material.dart';
// import 'package:prayer/common/bottomappbar_widget.dart';
// import 'package:prayer/screens/home/homepage.dart';

// class HomeBar extends StatefulWidget {
//   const HomeBar({
//     super.key,
//   });

//   @override
//   State<HomeBar> createState() => _HomeBarState();
// }

// class _HomeBarState extends State<HomeBar> {
//   int selectTab = 0;
//   int _selectedIndex = 0;
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index % listArr.length;
//   //   });
//   // }

//   List<Widget> listArr = [HomePage()];
//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     // var media = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(children: [
//         HomePage(),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: BottomAppBar(
//             height: 80,
//             surfaceTintColor: Colors.transparent,
//             color: Colors.transparent,
//             padding: EdgeInsets.all(5),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 5,
//                         offset: Offset(0, -2))
//                   ],
//                   borderRadius: BorderRadius.all(Radius.circular(10))
//                   // BorderRadius.only(
//                   //     topLeft: Radius.circular(40), topRight: Radius.circular(40))
//                   ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: BottomTabWidget(
//                       icon: "assets/images/clock.png",
//                       selectIcon: "assets/images/clock.png",
//                       // icon: Icons.home_outlined,
//                       // selectIcon: Icons.home_rounded,
//                       isActive: selectTab == 0,
//                       onTap: () {
//                         selectTab = 0;
//                         _selectedIndex = selectTab;
//                         if (mounted) {
//                           setState(() {});
//                         }
//                         // _controller.animateToPage(_selectedIndex);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: BottomTabWidget(
//                       icon: "assets/images/book.png",
//                       selectIcon: "assets/images/book.png",
//                       isActive: selectTab == 1,
//                       onTap: () {
//                         selectTab = 1;
//                         _selectedIndex = selectTab;
//                         if (mounted) {
//                           setState(() {});
//                         }
//                         // _controller.animateToPage(_selectedIndex);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: BottomTabWidget(
//                       icon: "assets/images/qibla-compass.png",
//                       selectIcon: "assets/images/qibla-compass.png",
//                       isActive: selectTab == 2,
//                       onTap: () {
//                         selectTab = 2;
//                         _selectedIndex = selectTab;
//                         if (mounted) {
//                           setState(() {});
//                         }
//                         // _controller.animateToPage(_selectedIndex);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: BottomTabWidget(
//                       icon: "assets/images/setting.png",
//                       selectIcon: "assets/images/setting.png",
//                       isActive: selectTab == 3,
//                       onTap: () {
//                         selectTab = 3;
//                         _selectedIndex = selectTab;
//                         if (mounted) {
//                           setState(() {});
//                         }
//                         // _controller.animateToPage(_selectedIndex);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }