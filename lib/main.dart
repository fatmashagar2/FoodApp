
import 'package:category_app2/constant.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.categories,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRouter,
    );
  }
}


