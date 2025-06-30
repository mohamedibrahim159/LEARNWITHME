import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = true;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
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
                    buildTextField('Username', Icons.person_outline),
                    SizedBox(height: size.height * 0.02),
                    buildTextField(
                      'Password',
                      Icons.lock_outline,
                      isPassword: true,
                    ),
                    SizedBox(height: size.height * 0.02),
                    buildTextField(
                      'Email',
                      Icons.mail_outline,
                      controller: _emailController,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        Switch(
                          value: _rememberMe,
                          onChanged:
                              (value) => setState(() => _rememberMe = value),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeData.primarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'MVBoli',
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: themeData.blackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.white54, thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                          ),
                          child: const Text(
                            'or login with',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.white54, thickness: 1),
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
      child: TextField(
        controller: controller,
        obscureText: isPassword ? !_isPasswordVisible : false,
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
