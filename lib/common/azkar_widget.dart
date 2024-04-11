import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class AzkarWidget extends StatefulWidget {
  const AzkarWidget({super.key, required this.obj});
  final Map obj;

  @override
  State<AzkarWidget> createState() => _AzkarWidgetState();
}

class _AzkarWidgetState extends State<AzkarWidget> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.5, vertical: 3),
      child: InkWell(
        onTap: () {
          if (widget.obj["int"] > 0) {
            setState(() {
              widget.obj["int"] = widget.obj["int"] - 1;
            });
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Container(
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
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     widget.obj["basmala"],
                      //     style: const TextStyle(
                      //         color: Colors.black87,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.normal),
                      //     textDirection: TextDirection.rtl,
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(19),
                          // padding: const EdgeInsets.only(left: 25, right: 10),
                          child: Text(
                            widget.obj["Alzikr"],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     widget.obj["benefit"],
                      //     style: const TextStyle(
                      //         color: Colors.black54,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.normal),
                      //     textDirection: TextDirection.rtl,
                      //   ),
                      // ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.obj["int"] > 0) {
                        setState(() {
                          widget.obj["int"] = widget.obj["int"] - 1;
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: media.width * 0.12,
                      height: media.height * 0.055,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        color: Colors.black38,
                      ),
                      child: AnimatedFlipCounter(
                        value: widget.obj["int"],
                        // Use "infix" to show a value between negative sign and number

                        // Some languages like French use comma as decimal separator

                        // padding: const EdgeInsets.all(0),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
