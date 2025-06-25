import 'package:flutter/material.dart';
import 'package:learnwithme/loginScreen.dart';
import 'package:learnwithme/themeData.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 3),
            SizedBox(height: screenSize.height * 0.4),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'MVBoli',
                  fontSize: screenSize.width * 0.07,
                  color: themeData.primarycolor,
                  fontWeight: FontWeight.w600,
                ),
                children: const [
                  TextSpan(text: 'fun adventure to learn\n'),
                  TextSpan(text: 'letters'),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.025,
                  height: screenSize.width * 0.025,
                  decoration: BoxDecoration(
                    color: themeData.primarycolor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: screenSize.width * 0.025),
                Container(
                  width: screenSize.width * 0.025,
                  height: screenSize.width * 0.025,
                  decoration: BoxDecoration(
                    color: themeData.whitecolor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            SizedBox(height: screenSize.height * 0.025),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green.shade800,
                  minimumSize: Size(double.infinity, screenSize.height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'GET START',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: themeData.blackColor,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenSize.height * 0.015),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, screenSize.height * 0.07),
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'I ALREADY HAVE AN ACCOUNT',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenSize.height * 0.03),
          ],
        ),
      ),
    );
  }
}
