import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            SizedBox(
              height: 600,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'MVBoli',
                  fontSize: 35,
                  color: themeData.primarycolor,
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                ),
                children: [
                  TextSpan(text: 'fun adventure to learn\n'),
                  TextSpan(text: '       letters'),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: themeData.primarycolor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: themeData.whitecolor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // زر "GET START"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MainGameScreen()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green.shade800,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'GET START',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeData.blackColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OutlinedButton(
                onPressed: () {
                  // عرض نموذج تسجيل الدخول
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'I ALREADY HAVE AN ACCOUNT',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
