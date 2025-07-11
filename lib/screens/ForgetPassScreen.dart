import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';
import 'package:learnwithme/auth/presentation/view_models/forget_password/forget_password_cubit.dart';
import 'package:learnwithme/auth/presentation/view_models/reset_password/reset_password_cubit.dart';
import 'package:learnwithme/screens/newpassScreen.dart';
import 'package:learnwithme/screens/themeData.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ForgotPasswordCubit(AuthRepo()),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/forgetpassword_background.jpg',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                            border: Border.all(
                              color: themeData.whitecolor,
                              width: 3,
                            ),
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
                                child: TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your email",
                                    hintStyle: TextStyle(color: Colors.white60),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email is required';
                                    } else if (!isValidEmail(value)) {
                                      return 'Invalid email format';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                          listener: (context, state) {
                            if (state is ForgotPasswordSuccess) {
                              Fluttertoast.showToast(
                                msg: state.message,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => BlocProvider(
                                        create:
                                            (context) =>
                                                ResetPasswordCubit(AuthRepo()),
                                        child: const PasswordCreationScreen(),
                                      ),
                                ),
                              );
                            } else if (state is ForgotPasswordFailure) {
                              Fluttertoast.showToast(
                                msg: state.errorMessage,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            }
                          },
                          builder: (context, state) {
                            final isLoading = state is ForgotPasswordLoading;
                            return SizedBox(
                              width: double.infinity,
                              height: 61,
                              child: ElevatedButton(
                                onPressed:
                                    isLoading
                                        ? null
                                        : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<ForgotPasswordCubit>()
                                                .sendForgotPasswordEmail(
                                                  _emailController.text.trim(),
                                                );
                                          }
                                        },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff326F4F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child:
                                    isLoading
                                        ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                        : const Text(
                                          'Send OTP',
                                          style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'MVBoli',
                                            color: Colors.white,
                                          ),
                                        ),
                              ),
                            );
                          },
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
                                side: BorderSide(
                                  color: themeData.whitecolor,
                                  width: 1.4,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06,
                                vertical: 8,
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
