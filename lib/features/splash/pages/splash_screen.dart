import 'dart:async';
import 'package:category_app2/features/category/presentation/pages/category_screen.dart';
import 'package:category_app2/features/on_boarding_screens/on_boarding_screens.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the splash screen for 3 seconds
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen (e.g., HomeScreen)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF54749),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo or image here
            Image.asset(
              'assets/food-icon 1.png', // Replace with your image path
              height: 100,
              width: 100,
            ),
             ],
        ),
      ),
    );
  }
}
