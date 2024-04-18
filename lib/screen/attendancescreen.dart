import 'dart:async';

import 'package:flutter/material.dart';

import '../style/appStyle.dart';

class AttendaceScreen extends StatefulWidget {
  @override
  _AttendaceScreenState createState() => _AttendaceScreenState();
}

class _AttendaceScreenState extends State<AttendaceScreen> {
  bool isWorking = false;
  bool isPaused = false;
  late DateTime startTime;
  late DateTime pauseTime;
  late Timer _timer;
  int _secondsElapsed = 0;

  String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$hours hour: $minutes mins: $remainingSeconds secs';
  }

  void startWork() {
    setState(() {
      isWorking = true;
      startTime = DateTime.now();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _secondsElapsed++;
        });
      });
    });
  }

  void pauseWork() {
    setState(() {
      isPaused = true;
      pauseTime = DateTime.now();
      _timer.cancel();
    });
  }

  void resumeWork() {
    setState(() {
      isPaused = false;
      startTime = startTime.add(DateTime.now().difference(pauseTime));
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _secondsElapsed = DateTime.now().difference(startTime).inSeconds;
        });
      });
    });
  }

  void endWork() {
    setState(() {
      isWorking = false;
      _timer.cancel();
      // Here, you can submit the attendance data with startTime and endTime
      // For now, let's just print the duration
      print('Work Duration: ${formatDuration(_secondsElapsed)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Page',style: TextStyle(color: kthirdColor, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60,),
            Text(
              isWorking ? 'Tap to end the work' : 'Tap to start working:',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isWorking
                  ? isPaused
                  ? resumeWork
                  : pauseWork
                  : startWork,
              child: Text(
                isWorking
                    ? isPaused
                    ? 'Resume Work'
                    : 'Pause Work'
                    : 'Start Work',
              ),
            ),
            if (isWorking)
              SizedBox(height: 20),
            if (isWorking)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: endWork,
                    child: Text('End Work'),
                  ),
                  SizedBox(width: 10),

                ],
              ),
            if (isWorking)
              SizedBox(height: 20),
            if (isWorking)
              Text(
                'Working Duration: ${formatDuration(_secondsElapsed)}',
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: AttendaceScreen(),
  ));
}
