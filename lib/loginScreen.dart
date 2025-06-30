import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnwithme/ageSelectionScreen.dart';
import 'package:learnwithme/auth/data/models/login_model.dart';
import 'package:learnwithme/auth/presentation/view_models/cubit/login_cubit.dart';
import 'package:learnwithme/auth/presentation/view_models/cubit/login_state.dart';
import 'package:learnwithme/registerScreen.dart';
import 'package:learnwithme/themeData.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _rememberMe = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: size.height * 0.02),

                      // Top Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: themeData.primarycolor,
                              foregroundColor: themeData.blackColor,
                              side: BorderSide(
                                color: themeData.primarycolor,
                                width: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'MVBoli',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const AgeSelectionScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white70,
                                width: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontFamily: 'MVBoli',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.15),

                      Text(
                        'welcome back!',
                        style: TextStyle(
                          fontSize: size.width * 0.08,
                          fontFamily: 'MVBoli',
                          color: themeData.primarycolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Enter your email and password',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: themeData.secondarycolor,
                          fontFamily: 'MVBoli',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),

                      buildTextField(
                        'Email',
                        Icons.mail_outline,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),

                      buildTextField(
                        'Password',
                        Icons.lock_outline,
                        isPassword: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Switch(
                                value: _rememberMe,
                                onChanged:
                                    (val) => setState(() => _rememberMe = val),
                                activeColor: Colors.amber,
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  fontFamily: 'MVBoli',
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget password',
                              style: TextStyle(
                                fontFamily: 'MVBoli',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),

                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Fluttertoast.showToast(
                              msg: state.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const AgeSelectionScreen(),
                              ),
                            );
                          } else if (state is LoginFailure) {
                            Fluttertoast.showToast(
                              msg: state.errMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state is LoginLoading
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate()) {
                                        final email =
                                            _emailController.text.trim();
                                        final password =
                                            _passwordController.text.trim();
                                        final request = LoginRequest(
                                          email: email,
                                          password: password,
                                        );
                                        context.read<LoginCubit>().loginUser(
                                          request,
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: themeData.whitecolor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                              ),
                            ),
                            child:
                                state is LoginLoading
                                    ? Center(
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: const CircularProgressIndicator(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    )
                                    : Text(
                                      'Log in',
                                      style: TextStyle(
                                        color: themeData.whitecolor,
                                        fontFamily: 'MVBoli',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                          );
                        },
                      ),

                      SizedBox(height: size.height * 0.03),

                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white54)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                            ),
                            child: const Text(
                              'or login with',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.white54)),
                        ],
                      ),

                      SizedBox(height: size.height * 0.03),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: Image.asset(
                              'assets/icons/google_icon.png',
                              height: 24,
                              width: 24,
                            ),
                            label: const Text(
                              'Google',
                              style: TextStyle(
                                fontFamily: 'MVBoli',
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                            label: const Text(
                              'Facebook',
                              style: TextStyle(
                                fontFamily: 'MVBoli',
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.06),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white70,
                              width: 3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.07,
                              vertical: 8,
                            ),
                          ),
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              fontFamily: 'MVBoli',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
    );
  }

  Widget buildTextField(
    String hint,
    IconData icon, {
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? !_isPasswordVisible : false,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(icon, color: Colors.grey.shade600),
          suffixIcon:
              isPassword
                  ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey.shade600,
                    ),
                    onPressed:
                        () => setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        ),
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
