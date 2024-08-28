import 'package:flutter/material.dart';
import 'package:shared_preferences_practicle_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
