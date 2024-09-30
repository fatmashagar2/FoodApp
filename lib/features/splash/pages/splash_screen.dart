import 'dart:async';
import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:category_app2/features/on_boarding_screens/pages/on_boarding_screens.dart';
import 'package:category_app2/features/category/presentation/pages/category_screen.dart';
import 'splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnState();
  }

  Future<void> _navigateBasedOnState() async {

    await Future.delayed(Duration(seconds: 5));
   SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, "/on_boarding");

    } else {
      Navigator.pushReplacementNamed(context, "/categories");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.main,
      body: SplashScreenBody(),
    );
  }
}
