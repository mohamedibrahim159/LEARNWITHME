import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool isButtonEnabled = false;
  Timer? _timer;
  int _remainingTime = 59;

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.0005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 42,
                        width: 86,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Center(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontFamily: 'MVBoli',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.009),
                  const Text(
                    'Verify your E-mail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MVBoli',
                    ),
                  ),
                  SizedBox(height: size.height * 0.35),
                  Text(
                    'please enter your Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MVBoli',
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.005,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      controller: _pinController,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: size.width * 0.13,
                        fieldWidth: size.width * 0.13,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: Colors.transparent,
                        inactiveColor: Colors.transparent,
                        selectedColor: Colors.green,
                      ),
                      textStyle: TextStyle(
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold,
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
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled ? () {} : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Color(0xff326F4F);
                              }
                              return Color(0xff326F4F);
                            }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  SizedBox(height: size.height * 0.018),
                  Text(
                    'Resend Code in\n    00:${_remainingTime.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.052,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'MVBoli',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.09),
                  Row(
                    children: [
                      Container(
                        height: 42,
                        width: 86,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Center(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontFamily: 'MVBoli',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
