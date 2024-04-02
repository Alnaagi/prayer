import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:prayer/screens/home_bar.dart';
import 'package:prayer/var/var.dart';

// Replace 'YOUR_TIMEZONE_API_URL' with the actual URL of the time zone lookup service
const String timeZoneLookupUrl =
    'http://api.timezonedb.com/v2.1/get-time-zone?key=DSZ3001V5Q17&format=json&by=position';

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
  StreamSubscription<Position>? locationSubscription;
  @override
  void initState() {
    _getLocation();
    // _listenForLocationChanges();
    // _listenForLocationChanges();
    // _getLocationData();
    _listenForLocationChanges();
    _getTimeZoneFromLookupService_atlaunch();
    super.initState();

    // _listenForLocationChanges();
  }

  Future<void> _getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        // Permission denied forever, handle error
        errorMessage =
            "Location permissions are permanently denied. Please enable them from app settings.";
        return;
      }
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        latitudeloc = position.latitude;
        longitudeloc = position.longitude;
        _getLocationData();
        _getTimeZoneFromLookupService_atlaunch();
        _listenForLocationChanges();
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error getting location: $e";
      });
    }
  }

  void _listenForLocationChanges() {
    // Location stream for continuous updates (if available)
    timer = Timer.periodic(Duration(seconds: 30), (timer) async {
      try {
        final position2 = await Geolocator.getCurrentPosition(
            // timeLimit: Duration(seconds: 10),
            desiredAccuracy: LocationAccuracy.best);
        setState(() {
          latitudeloc = position2.latitude;
          longitudeloc = position2.longitude;

          _getLocationData();
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

    // Call external time zone lookup service
    _getTimeZoneFromLookupService();
  }

  Future<void> _getTimeZoneFromLookupService() async {
    timer = Timer.periodic(Duration(seconds: 30), (timer) async {
      try {
        final url =
            Uri.parse('$timeZoneLookupUrl&lat=$latitudeloc&lng=$longitudeloc');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final timeZoneData = jsonDecode(response.body);
          setState(() {
            timeZone = timeZoneData[
                "zoneName"]; // Assuming the API returns time zone ID in 'timeZoneId' key
          });
        } else {
          // Handle API request failure
          print('Error fetching time zone: ${response.statusCode}');
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
        timeZone = timeZoneData[
            "zoneName"]; // Assuming the API returns time zone ID in 'timeZoneId' key
      });
    } else {
      // Handle API request failure
      print('Error fetching time zone: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(timeZone);
    return const HomeBar();
  }
}
