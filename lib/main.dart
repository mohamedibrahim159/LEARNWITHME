import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learnwithme/auth/data/models/forgot_password.dart';
import 'package:learnwithme/auth/data/models/login_model.dart';
import 'package:learnwithme/auth/data/models/register_model.dart';
import 'package:learnwithme/auth/data/models/reset_password.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';
import 'package:learnwithme/auth/presentation/view_models/login/login_cubit.dart';
import 'package:learnwithme/screens/loginScreen.dart';

import 'package:learnwithme/ageSelectionScreen.dart';
import 'package:learnwithme/screens/video_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn With Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => LoginCubit(AuthRepo()),
        child: VideoSplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final String? token = await storage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      // ✅ فيه توكن => روح للصفحة الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AgeSelectionScreen()),
      );
    } else {
      // ❌ مفيش توكن => روح على LoginScreen
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: CircularProgressIndicator(color: Colors.blue)),
    );
  }
}

class AuthTestScreen extends StatefulWidget {
  const AuthTestScreen({super.key});

  @override
  State<AuthTestScreen> createState() => _AuthTestScreenState();
}

class _AuthTestScreenState extends State<AuthTestScreen> {
  final AuthRepo authRepo = AuthRepo();

  Future<void> testRegister() async {
    final response = await authRepo.register(
      RegisterRequest(
        name: 'Test User',
        email: 'testuser@gmail.com',
        password: '123456',
      ),
    );
    log('✅ Register Response: ${response.message}');
  }

  Future<void> testLogin() async {
    final response = await authRepo.login(
      LoginRequest(email: 'testuser@gmail.com', password: '123456'),
    );
    log('✅ Login Response: ${response.message}');
  }

  Future<void> testForgotPassword() async {
    final response = await authRepo.forgotPassword(
      ForgotPasswordRequest(email: 'testuser@gmail.com'),
    );
    log('✅ Forgot Password Response: ${response.message}');
  }

  Future<void> testResetPassword() async {
    final response = await authRepo.resetPassword(
      ResetPasswordRequest(
        email: 'testuser@gmail.com',
        otpCode: '123456', // 👈 لازم تحط OTP حقيقي
        newPassword: 'newpass123',
        confirmPassword: 'newpass123',
      ),
    );
    log('✅ Reset Password Response: ${response.message}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth API Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: testRegister,
              child: const Text('Test Register'),
            ),
            ElevatedButton(
              onPressed: testLogin,
              child: const Text('Test Login'),
            ),
            ElevatedButton(
              onPressed: testForgotPassword,
              child: const Text('Test Forgot Password'),
            ),
            ElevatedButton(
              onPressed: testResetPassword,
              child: const Text('Test Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
