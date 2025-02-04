import 'package:flutter/material.dart';

import 'package:prison_foodie_delivey/features/signup/signup_second_screen.dart';

import 'package:prison_foodie_delivey/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SignupSecondScreen(),
    );
  }
}
