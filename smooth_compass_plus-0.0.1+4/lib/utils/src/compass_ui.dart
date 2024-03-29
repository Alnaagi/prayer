import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../smooth_compass_plus.dart';
import 'widgets/error_widget.dart';

double preValue = 0;
double turns = 0;

///custom callback for building widget
typedef WidgetBuilder = Widget Function(BuildContext context,
    AsyncSnapshot<CompassModel>? compassData, Widget compassAsset);

class SmoothCompassWidget extends StatefulWidget {
  final WidgetBuilder? compassBuilder;
  final Widget? compassAsset;
  final Widget? loadingAnimation;
  final int? rotationSpeed;
  final double? height;
  final double? width;
  final bool? isQiblahCompass;
  final Widget? errorLocationServiceWidget;
  final Widget? errorLocationPermissionWidget;

  const SmoothCompassWidget(
      {Key? key,
      this.compassBuilder,
      this.compassAsset,
      this.rotationSpeed = 400,
      this.height = 200,
      this.width = 200,
      this.isQiblahCompass = false,
      this.errorLocationServiceWidget,
      this.errorLocationPermissionWidget,
      this.loadingAnimation})
      : super(key: key);

  @override
  State<SmoothCompassWidget> createState() => _SmoothCompassWidgetState();
}

class _SmoothCompassWidgetState extends State<SmoothCompassWidget> {
  var location = Location();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// check if the compass support available
    return FutureBuilder(
        future: Compass().isCompassAvailable(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return widget.loadingAnimation != null
                ? widget.loadingAnimation!
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }
          if (!snapshot.data!) {
            return const Center(
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("هذا الجهاز لا يدعم البوصلة")));
          }

          /// start compass stream
          return widget.isQiblahCompass!
              ? FutureBuilder<bool>(
                  future: location.serviceEnabled(),
                  builder: (context, AsyncSnapshot<bool> serviceSnapshot) {
                    if (serviceSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return widget.loadingAnimation ??
                          const Center(
                            child: CircularProgressIndicator(),
                          );
                    } else if (serviceSnapshot.data == false) {
                      return widget.errorLocationServiceWidget ??
                          CustomErrorWidget(
                            title: "Enable Location",
                            onTap: () async {
                              await location.requestService();
                              setState(() {});
                            },
                            errMsg: 'Location service is disabled',
                          );
                    }

                    /// to Check Location permission if denied
                    return FutureBuilder<PermissionStatus>(
                        future: location.hasPermission(),
                        builder: (context,
                            AsyncSnapshot<PermissionStatus>
                                permissionSnapshot) {
                          if (permissionSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return widget.loadingAnimation ??
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                          } else if ((permissionSnapshot.data!) ==
                              PermissionStatus.denied) {
                            return widget.errorLocationPermissionWidget ??
                                CustomErrorWidget(
                                    errMsg:
                                        "يرجى السماح بالحصول على اتجاه القبلة للموقع الحالي",
                                    title: "السماح بالأذونات",
                                    onTap: () async {
                                      var status =
                                          await location.requestPermission();

                                      if (status == PermissionStatus.granted ||
                                          status ==
                                              PermissionStatus.grantedLimited) {
                                        setState(() {});
                                      }
                                    });
                          } else if ((permissionSnapshot.data ??
                                  PermissionStatus.deniedForever) ==
                              PermissionStatus.deniedForever) {
                            return Platform.isAndroid
                                ? widget.errorLocationPermissionWidget ??
                                    CustomErrorWidget(
                                        onTap: () async {
                                          await location.requestPermission();
                                        },
                                        title: "Open Settings",
                                        errMsg:
                                            "Location is permanently denied")
                                : const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text(
                                          "please enable location permission from settings"),
                                    ),
                                  );
                          }
                          return FutureBuilder<LocationData?>(
                              future: location.getLocation(),
                              builder: (context,
                                  AsyncSnapshot<LocationData?>
                                      positionSnapshot) {
                                if (positionSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return widget.loadingAnimation ??
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                } else {
                                  return StreamBuilder<CompassModel>(
                                    stream: Compass().compassUpdates(
                                        interval: const Duration(
                                          milliseconds: 200,
                                        ),
                                        azimuthFix: 0.0,
                                        currentLoc: MyLoc(
                                            latitude: positionSnapshot
                                                    .data?.latitude ??
                                                0,
                                            longitude: positionSnapshot
                                                    .data?.longitude ??
                                                0)),
                                    builder: (context,
                                        AsyncSnapshot<CompassModel> snapshot) {
                                      if (widget.compassAsset == null) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return widget.loadingAnimation ??
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                        }
                                        if (snapshot.hasError) {
                                          return Text(
                                              snapshot.error.toString());
                                        }
                                        return widget.compassBuilder == null
                                            ? _defaultWidget(snapshot, context)
                                            : widget.compassBuilder!(
                                                context,
                                                snapshot,
                                                _defaultWidget(
                                                    snapshot, context));
                                      } else {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return widget.loadingAnimation ??
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                        }
                                        if (snapshot.hasError) {
                                          return Text(
                                              snapshot.error.toString());
                                        }
                                        return widget.compassBuilder == null
                                            ? AnimatedRotation(
                                                turns:
                                                    snapshot.data!.turns * -1,
                                                duration: Duration(
                                                    milliseconds:
                                                        widget.rotationSpeed!),
                                                child: widget.compassAsset!,
                                              )
                                            : widget.compassBuilder!(
                                                context,
                                                snapshot,
                                                AnimatedRotation(
                                                  turns:
                                                      snapshot.data!.turns * -1,
                                                  duration: Duration(
                                                      milliseconds: widget
                                                          .rotationSpeed!),
                                                  child: widget.compassAsset!,
                                                ),
                                              );
                                      }
                                    },
                                  );
                                }
                              });
                        });
                  })
              : StreamBuilder<CompassModel>(
                  stream: Compass().compassUpdates(
                      interval: const Duration(
                        milliseconds: 200,
                      ),
                      azimuthFix: 0.0,
                      currentLoc: MyLoc(latitude: 0, longitude: 0)),
                  builder: (context, AsyncSnapshot<CompassModel> snapshot) {
                    if (widget.compassAsset == null) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return widget.loadingAnimation ??
                            const Center(
                              child: CircularProgressIndicator(),
                            );
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return widget.compassBuilder == null
                          ? _defaultWidget(snapshot, context)
                          : widget.compassBuilder!(context, snapshot,
                              _defaultWidget(snapshot, context));
                    } else {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return widget.loadingAnimation ??
                            const Center(
                              child: CircularProgressIndicator(),
                            );
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return widget.compassBuilder == null
                          ? AnimatedRotation(
                              turns: snapshot.data!.turns * -1,
                              duration:
                                  Duration(milliseconds: widget.rotationSpeed!),
                              child: widget.compassAsset!,
                            )
                          : widget.compassBuilder!(
                              context,
                              snapshot,
                              AnimatedRotation(
                                turns: snapshot.data!.turns * -1,
                                duration: Duration(
                                    milliseconds: widget.rotationSpeed!),
                                child: widget.compassAsset!,
                              ),
                            );
                    }
                  },
                );
        });
  }

  ///default widget if custom widget isn't provided
  Widget _defaultWidget(
      AsyncSnapshot<CompassModel> snapshot, BuildContext context) {
    return AnimatedRotation(
      turns: snapshot.data!.turns,
      duration: Duration(milliseconds: widget.rotationSpeed!),
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.shortestSide * 0.8,
        width: widget.width ?? MediaQuery.of(context).size.shortestSide * 0.8,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/compass.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}

///calculating compass Model
getCompassValues(double heading, double latitude, double longitude) {
  double direction = heading;
  direction = direction < 0 ? (360 + direction) : direction;

  double diff = direction - preValue;
  if (diff.abs() > 180) {
    if (preValue > direction) {
      diff = 360 - (direction - preValue).abs();
    } else {
      diff = (360 - (preValue - direction).abs()).toDouble();
      diff = diff * -1;
    }
  }

  turns += (diff / 360);
  preValue = direction;

  return CompassModel(
      turns: -1 * turns,
      angle: heading,
      qiblahOffset: getQiblaDirection(latitude, longitude, heading));
}

/// model to store the sensor value
class CompassModel {
  double turns;
  double angle;
  double qiblahOffset;

  CompassModel(
      {required this.turns, required this.angle, required this.qiblahOffset});
}
