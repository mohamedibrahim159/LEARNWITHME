import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool isButtonEnabled = false;
  Timer? _timer;
  int _remainingTime = 59; // Initial countdown time in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background forest image with gradient overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/forgetpassword_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Skip button
                        Container(
                          height: 42,
                          width: 86,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: const Text(
                            'Skip',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'MVBoli',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                // Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Verify your E-mail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MVBoli',
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 300),

                // "please enter your Code" text
                const Text(
                  'please enter your Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'MVBoli',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 16),

                // PIN code input fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: _pinController,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      selectedColor: Colors.green,
                    ),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    onChanged: (value) {
                      setState(() {
                        isButtonEnabled = value.length == 6;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Verify button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: 333,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled ? () {} : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xff326F4F); // لون عند التعطيل
                          }
                          return Color(0xff326F4F); // لون عند التفعيل
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      child: const Text(
                        'verify',
                        style: TextStyle(
                          fontFamily: 'MVBoli',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Resend code text with timer
                Text(
                  'Resend Code in\n    00:${_remainingTime.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'MVBoli',
                  ),
                ),
SizedBox(
  height: 80,
),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: 42,
                        width: 86,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: const Text(
                          'Skip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'MVBoli',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,

                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}