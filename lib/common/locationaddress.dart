import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:prayer/common/prayer_widget_refresh.dart';
import 'package:prayer/controller/notif_schedule.dart';
import 'package:prayer/controller/test2.dart';
import 'package:prayer/screens/home_bar.dart';

import 'package:shared_preferences/shared_preferences.dart';

// Replace 'YOUR_TIMEZONE_API_URL' with the actual URL of the time zone lookup service
const String timeZoneLookupUrl =
    'http://api.timezonedb.com/v2.1/get-time-zone?key=DSZ3001V5Q17&format=json&by=position';

String apikey = "";
String timeZoneLookupUrl_BackUp =
    "https://api.opencagedata.com/geocode/v1/json?f098de6d8d1444fd965b9ba0fa3b1e62";

late double latitudeloc = 32.8877;
late double longitudeloc = 13.1872;
late String timeZone = "Africa/Tripoli";
late String locationName = "";
late String locationName1 = "";
late String locationName2 = "";
late String locationName3 = "";
late String locationName4 = "";

class LocationAddress extends StatefulWidget {
  @override
  _LocationAddressState createState() => _LocationAddressState();
}

class _LocationAddressState extends State<LocationAddress> {
  // double latitude = 0.0;
  // double longitude = 0.0;
  // String locationName = "";
  // String locationName1 = "";
  // String locationName2 = "";
  // String locationName3 = "";
  // String locationName4 = "";
  // String timeZone = "";
  String errorMessage = "";
  Timer? timer;
  Timer? timer2;
  Timer? timer3;
  StreamSubscription<Position>? locationSubscription;
  @override
  void initState() {
    loadData();

    _listenForLocationChanges();
    // _listenForLocationChanges();
    // _getLocationData();
    // _listenForLocationChanges2();
    // _getTimeZoneFromLookupService_atlaunch();
    super.initState();

    // _listenForLocationChanges();
  }

  // Future<void> _getLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();

  //     if (permission == LocationPermission.deniedForever) {
  //       Geolocator.openAppSettings();
  //       // Permission denied forever, handle error
  //       errorMessage =
  //           "Location permissions are permanently denied. Please enable them from app settings.";
  //       return;
  //     }
  //   }

  //   try {
  //     final Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best,
  //     );
  //     setState(() {
  //       latitudeloc = position.latitude;
  //       longitudeloc = position.longitude;
  //       _getLocationData();

  //       _listenForLocationChanges();
  //     });
  //   } catch (e) {
  //     setState(() {
  //       errorMessage = "Error getting location: $e";
  //     });
  //   }
  // }

  void _listenForLocationChanges() {
    // Location stream for continuous updates (if available)
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      try {
        final position2 = await Geolocator.getCurrentPosition(
            // timeLimit: Duration(seconds: 10),
            desiredAccuracy: LocationAccuracy.best);
        setState(() {
          latitudeloc = position2.latitude;
          longitudeloc = position2.longitude;
          updateLocation();
          _getLocationData();
          _getTimeZoneFromLookupService_atlaunch();
          // timer.cancel();
          // _listenForLocationChanges(); // Call your location data processing function here
        });
      } catch (e) {
        setState(() {
          errorMessage = "Error getting location: $e";
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer2?.cancel();
    locationSubscription?.cancel(); // Cancel subscription when done
    super.dispose();
  }

  Future<void> _getLocationData() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are disabled.
      return;
    }

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitudeloc, longitudeloc);
    if (placemarks.isNotEmpty) {
      setState(() {
        locationName = placemarks[0].locality!;
        locationName1 = placemarks[0].name!;
        locationName2 = placemarks[0].administrativeArea!;
        locationName3 = placemarks[0].country!;
        locationName4 = placemarks[0].street!;
      });
    }
    updateLocationName();
    // Call external time zone lookup service
    _getTimeZoneFromLookupService();
  }

  Future<void> _getTimeZoneFromLookupService() async {
    timer2 = Timer.periodic(Duration(seconds: 10), (timer) async {
      // print('Error fetching time zone*************:');
      try {
        final url =
            Uri.parse('$timeZoneLookupUrl&lat=$latitudeloc&lng=$longitudeloc');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final timeZoneData = jsonDecode(response.body);
          setState(() {
            timeZone = timeZoneData["zoneName"];
            print("Good");
            // Refreshgood.maingood();
            test2.Notif2();

            updateTimeZone();
            timer.cancel();
            timer2
                ?.cancel(); // Assuming the API returns time zone ID in 'timeZoneId' key
          });

          updateTimeZone();
        } else {
          _getTimeZoneFromLookupService_BackUp();
          // Handle API request failure
          // _getTimeZoneFromLookupService_BackUp();
          // print('Error fetching time zone: ${response.statusCode}');
        }
      } catch (e) {
        setState(() {
          errorMessage = "Error getting time zone: $e";
        });
      }
    });
  }

  Future<void> _getTimeZoneFromLookupService_atlaunch() async {
    final url =
        Uri.parse('$timeZoneLookupUrl&lat=$latitudeloc&lng=$longitudeloc');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final timeZoneData = jsonDecode(response.body);
      setState(() {
        timeZone = timeZoneData["zoneName"];
        updateTimeZone(); // Assuming the API returns time zone ID in 'timeZoneId' key
      });
    } else {
      // Handle A
      //PI request failure
      // _getTimeZoneFromLookupService_BackUp();
      // print('Error fetching time zone: ${response.statusCode}');
    }
  }

  Future<void> _getTimeZoneFromLookupService_BackUp() async {
    final url =
        Uri.parse('$timeZoneLookupUrl_BackUp&q=$latitudeloc%2C$longitudeloc');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final timeZoneData = jsonDecode(response.body);
      // print("**************Backup is Working*****************");
      updateTimeZone();
      setState(() {
        timeZone = timeZoneData[{
          "timezone": {"name"}
        }];

        // Assuming the API returns time zone ID in 'timeZoneId' key
      });
    } else {
      // Handle API request failure
      // print('Error fetching time zone: ${response.statusCode}');
    }
  }

  // void _listenForLocationChanges2() {
  //   // Location stream for continuous updates (if available)
  //   timer3 = Timer.periodic(Duration(seconds: 1), (timer3) async {
  //     LocationPermission permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();

  //       if (permission == LocationPermission.deniedForever) {
  //         Geolocator.openAppSettings();
  //         // Permission denied forever, handle error
  //         errorMessage =
  //             "Location permissions are permanently denied. Please enable them from app settings.";
  //         return;
  //       }
  //     }
  //     try {
  //       final position2 = await Geolocator.getCurrentPosition(
  //           // timeLimit: Duration(seconds: 10),
  //           desiredAccuracy: LocationAccuracy.best);
  //       setState(() {
  //         latitudeloc = position2.latitude;
  //         longitudeloc = position2.longitude;

  //         _getLocationData();
  //         // _listenForLocationChanges(); // Call your location data processing function here
  //         timer3.cancel();
  //       });
  //     } catch (e) {
  //       setState(() {
  //         errorMessage = "Error getting location: $e";
  //       });
  //     }
  //   });
  // }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      latitudeloc = prefs.getDouble("latitudeloc") ?? 32.8877;
      longitudeloc = prefs.getDouble("longitudeloc") ?? 13.1872;
      timeZone = prefs.getString("timeZone") ?? "Africa/Tripoli";
      locationName = prefs.getString("locationName") ?? "";
      locationName3 = prefs.getString("locationName3") ?? "";
      locationName2 = prefs.getString("locationName2") ?? "";
    });
  }

  void updateLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble("latitudeloc", latitudeloc);
      prefs.setDouble("longitudeloc", longitudeloc);
    });
  }

  void updateTimeZone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("timeZone", timeZone);
    });
  }

  void updateLocationName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("locationName", locationName);
      prefs.setString("locationName2", locationName2);
      prefs.setString("locationName3", locationName3);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(timeZone);
    return const HomeBar();
  }
}
