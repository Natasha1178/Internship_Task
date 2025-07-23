import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_tasks/WeekOne/login_Screen.dart';
import 'package:internship_tasks/WeekTwo/CounterApp/counter_shared_pref.dart';
import 'WeekThree/Views/taskmang_splash_screen.dart';
import 'WeekTwo/TodoApp/splash_Screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      title: 'Intersnship Tasks',
       home: SplashScreen(),
    );
  }
}

