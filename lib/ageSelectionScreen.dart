import 'package:flutter/material.dart';
import 'package:learnwithme/introductionScreen.dart';
import 'package:learnwithme/themeData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgeSelectionScreen extends StatelessWidget {
  const AgeSelectionScreen({Key? key}) : super(key: key);

  Future<void> _saveAgeAndNavigate(BuildContext context, String age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('child_age', age);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/ageScreen.jpg', fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: size.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IntroScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: themeData.whitecolor, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.07,
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
          ),
          Column(
            children: [
              Spacer(flex: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Text(
                  'What age is your child?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MVBoli',
                    color: themeData.primarycolor,
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  children: [
                    _buildAgeButton(context, "4 - 5 years", size),
                    SizedBox(height: size.height * 0.02),
                    _buildAgeButton(context, "6 - 7 years", size),
                    SizedBox(height: size.height * 0.02),
                    _buildAgeButton(context, "7 - 8 years", size),
                  ],
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgeButton(BuildContext context, String text, Size size) {
    return InkWell(
      onTap: () => _saveAgeAndNavigate(context, text),
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: themeData.whitecolor, width: 3),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.03),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.055,
                fontFamily: 'MVBoli',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
