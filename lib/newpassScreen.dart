import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class PasswordCreationScreen extends StatefulWidget {
  const PasswordCreationScreen({Key? key}) : super(key: key);

  @override
  State<PasswordCreationScreen> createState() => _PasswordCreationScreenState();
}

class _PasswordCreationScreenState extends State<PasswordCreationScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/createnewpassword_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.green.withOpacity(0.3),
              BlendMode.overlay,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 255,
                    ),
                    Container(
                      height: 35,
                      width: 86,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
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
              const SizedBox(height: 10),
              const Text(
                'Create New password',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'MVBoli'
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 300),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.centerStart,

                      child: Text(
                        "  New Password",
                        style: TextStyle(
                          color: themeData.whitecolor,
                          fontSize: 18,
                          fontFamily: 'MVBoli',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    // New Password Field
                    Container(
                      height: 68,
                      width: 338,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.fromBorderSide(BorderSide(
                          color: themeData.whitecolor,
                          width: 3
                        ))
                      ),
                      child: Center(
                        child: TextField(
                          obscureText: _obscurePassword,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: themeData.whitecolor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      alignment: AlignmentDirectional.centerStart,

                      child: Text(
                        "  Confirm Password",
                        style: TextStyle(
                            color: themeData.whitecolor,
                            fontSize: 18,
                            fontFamily: 'MVBoli',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    // Confirm Password Field
                    Container(
                      height: 68,
                      width: 338,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.fromBorderSide(BorderSide(
                              color: themeData.whitecolor,
                              width: 3
                          ))
                      ),
                      child: Center(
                        child: TextField(
                          obscureText: _obscurePassword,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: themeData.whitecolor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Submit Button
                    SizedBox(
                      width: 338,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff326F4F),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    // Back Button
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 86,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: const Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'MVBoli',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2,

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
