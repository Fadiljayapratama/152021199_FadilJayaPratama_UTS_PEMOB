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
import 'package:project_pemob/screens/listview.dart';
import 'package:project_pemob/screens/crud_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_pemob/firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
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
