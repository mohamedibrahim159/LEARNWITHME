import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';
import 'package:learnwithme/auth/presentation/view_models/login/login_cubit.dart';
import 'package:learnwithme/auth/presentation/view_models/reset_password/reset_password_cubit.dart';
import 'package:learnwithme/loginScreen.dart';
import 'package:learnwithme/themeData.dart';

class PasswordCreationScreen extends StatefulWidget {
  const PasswordCreationScreen({super.key});

  @override
  State<PasswordCreationScreen> createState() => _PasswordCreationScreenState();
}

class _PasswordCreationScreenState extends State<PasswordCreationScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (value.length != 6 || !RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Enter a valid 6-digit OTP';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double fieldWidth = screenWidth * 0.85;
    final double buttonWidth = screenWidth * 0.85;

    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Fluttertoast.showToast(
            msg: state.message,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create: (context) => LoginCubit(AuthRepo()),
                    child: const LoginScreen(),
                  ),
            ),
          );
        } else if (state is ResetPasswordFailure) {
          Fluttertoast.showToast(
            msg: state.errorMessage,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/createnewpassword_background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Back Button
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 35,
                                width: 86,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                      fontFamily: 'MVBoli',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Create New Password',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'MVBoli',
                            ),
                          ),
                          const SizedBox(height: 100),

                          /// Email Field
                          _buildLabel("Email"),
                          _buildTextField(
                            _emailController,
                            _validateEmail,
                            TextInputType.emailAddress,
                            fieldWidth,
                          ),

                          const SizedBox(height: 15),

                          /// OTP Field
                          _buildLabel("OTP"),
                          _buildTextField(
                            _otpController,
                            _validateOtp,
                            TextInputType.number,
                            fieldWidth,
                            maxLength: 6,
                          ),

                          const SizedBox(height: 15),

                          /// New Password
                          _buildLabel("New Password"),
                          _buildPasswordField(
                            _passwordController,
                            fieldWidth,
                            isConfirm: false,
                          ),

                          const SizedBox(height: 15),

                          /// Confirm Password
                          _buildLabel("Confirm Password"),
                          _buildPasswordField(
                            _confirmPasswordController,
                            fieldWidth,
                            isConfirm: true,
                          ),

                          const SizedBox(height: 30),

                          /// Submit Button
                          SizedBox(
                            width: buttonWidth,
                            height: 50,
                            child: ElevatedButton(
                              onPressed:
                                  state is ResetPasswordLoading
                                      ? null
                                      : () {
                                        if (_formKey.currentState!.validate()) {
                                          if (_passwordController.text ==
                                              _confirmPasswordController.text) {
                                            BlocProvider.of<ResetPasswordCubit>(
                                              context,
                                            ).resetPassword(
                                              email: _emailController.text,
                                              otp: _otpController.text,
                                              newPassword:
                                                  _passwordController.text,
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: "Passwords do not match",
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                            );
                                          }
                                        }
                                      },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff326F4F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child:
                                  state is ResetPasswordLoading
                                      ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        ),
                                      )
                                      : const Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                            ),
                          ),

                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "  $text",
        style: TextStyle(
          color: themeData.whitecolor,
          fontSize: 18,
          fontFamily: 'MVBoli',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String? Function(String?) validator,
    TextInputType inputType,
    double width, {
    int? maxLength,
  }) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: themeData.whitecolor, width: 3),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        validator: validator,
        keyboardType: inputType,
        maxLength: maxLength,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.all(16),
          hintStyle: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    double width, {
    required bool isConfirm,
  }) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: themeData.whitecolor, width: 3),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isConfirm ? _obscureConfirmPassword : _obscurePassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              (isConfirm ? _obscureConfirmPassword : _obscurePassword)
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: themeData.whitecolor,
            ),
            onPressed: () {
              setState(() {
                if (isConfirm) {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                } else {
                  _obscurePassword = !_obscurePassword;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
