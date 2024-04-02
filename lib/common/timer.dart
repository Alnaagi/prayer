import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final Duration initialTime;

  const CountdownTimer({Key? key, required this.initialTime}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Duration _duration = Duration(seconds: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _duration = widget.initialTime;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _duration -= Duration(seconds: 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    // Only show minutes and seconds when hours are greater than 0
    // final showHours = _duration.inHours > 0;
    final hours = twoDigits(_duration.inHours);
    // final hours = showHours ? twoDigits(_duration.inHours) : "";
    final minutes = twoDigits(_duration.inMinutes % 60);
    final seconds = twoDigits(_duration.inSeconds % 60);

    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
        fontSize: 32.0,
      ),
    );
  }
}

// class CountdownTimer extends StatefulWidget {
//   final Duration initialDuration;

//   const CountdownTimer({Key? key, required this.initialDuration})
//       : super(key: key);

//   @override
//   _CountdownTimerState createState() => _CountdownTimerState();
// }

// class _CountdownTimerState extends State<CountdownTimer> {
//   Duration _duration = Duration(seconds: 0);
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _resetTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _resetTimer() {
//     _duration = widget.initialDuration;
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       setState(() {
//         _duration -= Duration(seconds: 1);
//         if (_duration <= Duration.zero) {
//           t.cancel();
//           // Timer finished - You can add your logic here
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     final hours = twoDigits(_duration.inHours);
//     final minutes = twoDigits(_duration.inMinutes % 60);
//     final seconds = twoDigits(_duration.inSeconds % 60);

//     return Text(
//       'بقى $hours:$minutes:$seconds',
//       style: TextStyle(
//         fontSize: 32.0,
//       ),
//     );
//   }
// }

class CountUpTimer extends StatefulWidget {
  final Duration initialTime;

  const CountUpTimer({Key? key, required this.initialTime}) : super(key: key);

  @override
  _CountUpTimerState createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  Duration _duration = Duration(seconds: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _duration = widget.initialTime;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _duration += Duration(seconds: 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    // Only show minutes and seconds when hours are greater than 0
    final hours = twoDigits(_duration.inHours);
    // final hours = showHours ? twoDigits(_duration.inHours) : "";
    final minutes = twoDigits(_duration.inMinutes % 60);
    final seconds = twoDigits(_duration.inSeconds % 60);

    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
        fontSize: 32.0,
      ),
    );
  }
}



// class CountupTimer extends StatefulWidget {
//   final Duration initialDuration;

//   const CountupTimer({Key? key, required this.initialDuration})
//       : super(key: key);

//   @override
//   _CountupTimerState createState() => _CountupTimerState();
// }

// class _CountupTimerState extends State<CountupTimer> {
//   Duration _duration = Duration(seconds: 0);
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _resetTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _resetTimer() {
//     _duration = widget.initialDuration;
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       setState(() {
//         _duration += Duration(seconds: 1);
//         if (_duration <= Duration.zero) {
//           t.cancel();
//           // Timer finished - You can add your logic here
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     final hours = twoDigits(_duration.inHours);
//     final minutes = twoDigits(_duration.inMinutes % 60);
//     final seconds = twoDigits(_duration.inSeconds % 60);

//     return Text(
//       ' مضى $hours:$minutes:$seconds',
//       style: TextStyle(
//         fontSize: 32.0,
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'dart:async';

// class CustomTimer extends StatefulWidget {
//   final DateTime endtime;
//   const CustomTimer({Key? key, required this.endtime}) : super(key: key);

//   @override
//   State<CustomTimer> createState() => _CustomTimerState();
// }

// class _CustomTimerState extends State<CustomTimer> {
//   DateTime endtime = DateTime.now();
//   Timer? timer;
//   Duration remainTime = Duration();

//   newTime() {
//     // print('hi');
//     setState(() {
//       final seconds = remainTime.inSeconds + 1;
//       remainTime = Duration(seconds: seconds);
//     });
//   }

//   @override
//   void initState() {
//     remainTime = widget.endtime.difference(DateTime.now());
//     timer = Timer.periodic(const Duration(seconds: 1), (_) => newTime());
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(remainTime.toString().split('.')[0].split('')[0] == '-'
//         ? "00:00:00"
//         : remainTime.toString().split('.')[0]);
//   }
// }
