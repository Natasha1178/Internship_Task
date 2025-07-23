// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:internship_tasks/WeekThree/Views/get_started.dart';
import 'dart:async';
class TaskmangSplashScreen extends StatefulWidget {
  @override
  _TaskmangSplashScreenState createState() => _TaskmangSplashScreenState();
}

class _TaskmangSplashScreenState extends State<TaskmangSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait 2 seconds then go to HomeScreen
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStarted()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image(
                       image: AssetImage('assets/task.png',),
                       fit: BoxFit.cover,
                       colorBlendMode: BlendMode.modulate,
                       color: Colors.deepPurple,
               height: 100,
               width: 100,
             ),
           
            SizedBox(height: 10),
            Text(
              'Task Management App',
              style: TextStyle(fontSize: 27, color: Colors.white,fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
