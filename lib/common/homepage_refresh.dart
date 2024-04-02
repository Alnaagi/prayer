import 'dart:async';
import 'package:prayer/var/var.dart';
import 'package:flutter/material.dart';
import 'package:prayer/screens/home/homepage_middle.dart';

class HomepageRefresh extends StatefulWidget {
  @override
  _HomepageRefreshState createState() => _HomepageRefreshState();
}

class _HomepageRefreshState extends State<HomepageRefresh> {
  Timer? _timer;
  // Flag to indicate data fetching state

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const refreshDuration = Duration(seconds: 3);

    _timer = Timer.periodic(refreshDuration, (_) async {
      setState(() {
        isFetchingData = true; // Show loading indicator
      });
      try {
        await _fetchData(); // Fetch data asynchronously
        setState(() {
          isFetchingData = false; // Hide loading indicator
        });
      } catch (error) {
        // Handle network errors gracefully (e.g., display an error message)
        print('Error fetching data: $error');
      }
    });
  }

  Future<void> _fetchData() async {
    // Your code to fetch data asynchronously (e.g., using a network call)
    // ...
    // Update state variables based on fetched data (if applicable)
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return isFetchingData ? CircularProgressIndicator() : HomePageCopy();
  }
}
