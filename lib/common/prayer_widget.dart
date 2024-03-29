import 'dart:ui';

import 'package:flutter/material.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({super.key, required this.obj});
  final Map obj;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              // color: Colors.yellow,
              borderRadius: BorderRadius.circular(15),
              // border:
              //     Border.symmetric(horizontal: BorderSide(color: Colors.black)),

              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.white70,
                    spreadRadius: 5,
                    offset: Offset(2, 4))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    obj["Time"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    obj["Name"],
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 10,
                //     ),
                //     child: Text(
                //       obj["benefit"],
                //       style: TextStyle(
                //           color: Colors.black54,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //       textDirection: TextDirection.rtl,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
