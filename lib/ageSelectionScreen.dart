import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgeSelectionScreen extends StatelessWidget {
  const AgeSelectionScreen({Key? key}) : super(key: key);

  // Function to save age selection and navigate to next screen
  Future<void> _saveAgeAndNavigate(BuildContext context, String age) async {
    // Save age to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('child_age', age);

    // Navigate to next screen
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => WelcomeScreen(childAge: age)),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full background image with character and jungle
          Image.asset('assets/images/ageScreen.jpg', fit: BoxFit.cover),

          // Skip button at top right
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: AlignmentDirectional.topEnd,
              child: SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: themeData.whitecolor, width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 2,
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'MVBoli',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content column
          Column(
            children: [
              const Spacer(flex: 4),

              const Spacer(flex: 40),

              // "What age is your child?" text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'What age is your child?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MVBoli',
                    color: themeData.primarycolor,
                    // Golden/yellow color as in image
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Age selection buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    _buildAgeButton(context, "4 - 5 years"),
                    const SizedBox(height: 12),
                    _buildAgeButton(context, "6 - 7 years"),
                    const SizedBox(height: 12),
                    _buildAgeButton(context, "7 - 8 years"),
                  ],
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgeButton(BuildContext context, String text) {
    return Column(
      children: [
        InkWell(
          onTap: () => _saveAgeAndNavigate(context, text),
          child: Container(
            width: 342,
            height: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: themeData.whitecolor, width: 3),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'MVBoli',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
