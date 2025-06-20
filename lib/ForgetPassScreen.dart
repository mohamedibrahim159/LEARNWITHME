import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/forgetpassword_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: themeData.whitecolor),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 8),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'MVBoli',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.001),
                    const Text(
                      'Forgot password',
                      style: TextStyle(
                        fontFamily: 'MVBoli',
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.33),
                    const Text(
                      'please enter your Email',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'MVBoli',
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                            blurRadius: 8.0,
                            color: Colors.black38,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.025),
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                        border: Border.all(color: themeData.whitecolor, width: 3),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12),
                          ImageIcon(
                            const AssetImage('assets/icons/email.png'),
                            size: 30,
                            color: themeData.whitecolor,
                          ),
                          SizedBox(width: 10),
                          Container(
                            color: themeData.whitecolor,
                            width: 2,
                            height: 40,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white60),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SizedBox(
                      width: double.infinity,
                      height: 61,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_emailController.text.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Reset link sent to your email'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff326F4F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'MVBoli',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: themeData.whitecolor, width: 1.4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: 8),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'MVBoli',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
