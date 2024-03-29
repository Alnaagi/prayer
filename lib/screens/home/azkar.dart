import 'package:flutter/material.dart';
import 'package:prayer/screens/azkar/afternoon.dart';
import 'package:prayer/screens/azkar/afterprayer.dart';
import 'package:prayer/screens/azkar/morning.dart';

class AzkarPage extends StatefulWidget {
  const AzkarPage({super.key});

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 191, 120, 73),
          appBar: AppBar(
            forceMaterialTransparency: true,
            centerTitle: true,
            shadowColor: Colors.black,
            title: Text(
              "الأذكار",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              dividerColor: Colors.black87,
              dividerHeight: .8,
              indicatorColor: Colors.black87,
              indicatorWeight: 2,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "أذكار الصباح",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "أذكار المساء",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "أذكار بعد الصلاة",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.2,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MorningPage(),
              AfternoonPage(),
              AfterPrayerPage(),
            ],
          ),
        ));
  }
}
