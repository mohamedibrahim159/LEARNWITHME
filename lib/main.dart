import 'package:flutter/material.dart';
import 'package:learnwithme/ForgetPassScreen.dart';
import 'package:learnwithme/ageSelectionScreen.dart';
import 'package:learnwithme/genderScreen.dart';
import 'package:learnwithme/loginScreen.dart';
import 'package:learnwithme/newpassScreen.dart';
import 'package:learnwithme/registerScreen.dart';
import 'package:learnwithme/verifyEmail.dart';
import 'package:learnwithme/welcomeScreen.dart';

import 'MainScreen.dart';
import 'forLearnerScreen.dart';
import 'home.dart';
import 'introductionScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn With Me',
      theme: ThemeData(),
      home: WelcomeScreen(),
    );
  }
}
