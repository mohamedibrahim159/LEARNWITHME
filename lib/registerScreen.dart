import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnwithme/auth/data/models/register_model.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';
import 'package:learnwithme/auth/presentation/view_models/login/login_cubit.dart';
import 'package:learnwithme/auth/presentation/view_models/register/register_cubit.dart';
import 'package:learnwithme/loginScreen.dart';
import 'package:learnwithme/themeData.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
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
                          (context) => BlocProvider(
                            create: (context) => LoginCubit(AuthRepo()),
                            child: const LoginScreen(),
                          ),
                    ),
                  );
                } else if (state is RegisterFailure) {
                  Fluttertoast.showToast(
                    msg: state.errorMessage,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: size.height * 0.02),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => BlocProvider(
                                            create:
                                                (context) =>
                                                    LoginCubit(AuthRepo()),
                                            child: const LoginScreen(),
                                          ),
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
                                    horizontal: size.width * 0.04,
                                    vertical: 8,
                                  ),
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontFamily: 'MVBoli',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              OutlinedButton(
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
                                    horizontal: size.width * 0.04,
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
                          SizedBox(height: size.height * 0.06),
                          Text(
                            'Hello!',
                            style: TextStyle(
                              fontSize: size.width * 0.08,
                              fontFamily: 'MVBoli',
                              color: themeData.primarycolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Register to get started',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              color: themeData.secondarycolor,
                              fontFamily: 'MVBoli',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),
                          buildTextField(
                            'Username',
                            Icons.person_outline,
                            controller: _usernameController,
                          ),
                          SizedBox(height: size.height * 0.02),
                          buildTextField(
                            'Email',
                            Icons.mail_outline,
                            controller: _emailController,
                          ),
                          SizedBox(height: size.height * 0.02),
                          buildTextField(
                            'Password',
                            Icons.lock_outline,
                            isPassword: true,
                            controller: _passwordController,
                          ),

                          SizedBox(height: size.height * 0.02),
                          Row(
                            children: [
                              Switch(
                                value: _rememberMe,
                                onChanged:
                                    (value) =>
                                        setState(() => _rememberMe = value),
                                activeColor: themeData.primarycolor,
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
                          SizedBox(height: size.height * 0.02),

                          ElevatedButton(
                            onPressed:
                                state is RegisterLoading
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate()) {
                                        final request = RegisterRequest(
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim(),
                                          name: _usernameController.text.trim(),
                                        );
                                        context
                                            .read<RegisterCubit>()
                                            .registerUser(request);
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Please fill all fields',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeData.primarycolor,
                              // foregroundColor: themeData.whitecolor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: themeData.whitecolor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                              ),
                            ),
                            child:
                                state is RegisterLoading
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
                                      'Register',
                                      style: TextStyle(
                                        color: themeData.whitecolor,
                                        fontFamily: 'MVBoli',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                          ),

                          SizedBox(height: size.height * 0.03),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white54,
                                  thickness: 1,
                                ),
                              ),
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
                              Expanded(
                                child: Divider(
                                  color: Colors.white54,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
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
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                                label: const Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontFamily: 'MVBoli',
                                    color: Colors.black87,
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
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.05),
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
                          SizedBox(height: size.height * 0.03),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
        validator: (value) {
          if (hint == 'Email') {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            final emailRegex = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            );
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
          }

          if (hint == 'Username') {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            if (value.length < 3) {
              return 'Username must be at least 3 characters';
            }
          }
          if (hint == 'Password' && isPassword) {
            if (value == null || value.isEmpty || value.trim().isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
          }
          if (value == null ||
              value.isEmpty ||
              value.trim().isEmpty ||
              (isPassword && value.length < 6)) {
            return 'Please enter $hint';
          }
          return null;
        },
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
