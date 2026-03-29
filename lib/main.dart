import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gianmari_flutterapp/screens/home_screen.dart';
import 'package:gianmari_flutterapp/screens/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Try to fetch cameras here to see if the system even sees them
  try {
    await availableCameras();
  } catch (e) {
    print("Camera check failed: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}

