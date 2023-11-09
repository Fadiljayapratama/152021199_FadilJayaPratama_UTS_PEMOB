import 'package:flutter/material.dart';
import 'package:project_pemob/screens/dashboard_screens.dart';
import 'package:project_pemob/screens/register_screen.dart';
import 'package:project_pemob/screens/splash_screen.dart';
import 'package:project_pemob/screens/login_screen.dart';
import 'package:project_pemob/screens/home_screen.dart';
import 'package:project_pemob/screens/profile_screen.dart';
import 'package:project_pemob/screens/bmi_screens.dart';
import 'package:project_pemob/screens/kalkulator_screens.dart';
import 'package:project_pemob/screens/konversisuhu_screens.dart';
import 'package:project_pemob/screens/konversiuang_screens.dart';
import 'package:project_pemob/screens/konversipanjang_screens.dart';
import 'package:project_pemob/screens/about_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreens(),
    );
  }
}
