import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _rememberMe = true;
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
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الشاشة مع الرسومات
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.jpg'), // قم بتغيير هذا لصورة الخلفية الخاصة بك
                fit: BoxFit.cover,
              ),
            ),
          ),
          // طبقة التعتيم لتحسين قراءة النص
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // محتوى الشاشة
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // أزرار التنقل العلوية
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: themeData.primarycolor,
                          foregroundColor: themeData.blackColor,
                          side: BorderSide(color: themeData.primarycolor, width: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: const Text('Sign up',
                           style:TextStyle(
                             fontFamily: 'MVBoli',
                                 fontWeight: FontWeight.bold,
                             fontSize: 20,
                           )
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white70, width: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: const Text('Skip',
                          style: TextStyle(
                            fontFamily: 'MVBoli',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // المساحة قبل العنوان
                  const Spacer(flex: 1),

                  // نص الترحيب
                  Text(
                    'welcome back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'MVBoli', // خط مناسب للنص المكتوب يدويًا
                      color: themeData.primarycolor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 6),

                  // نص التعليمات
                  Text(
                    'Enter your email and password',
                    style: TextStyle(
                      fontSize: 21,
                      color: themeData.secondarycolor,
                      fontFamily: 'MVBoli',
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 30),

                  // حقل البريد الإلكتروني
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.grey.shade600,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // حقل كلمة المرور
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.grey.shade600,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey.shade600,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // خيارات التذكر ونسيان كلمة المرور
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Switch(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                              activeColor: Colors.amber,
                              activeTrackColor: Colors.amber.withOpacity(0.5),
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey.withOpacity(0.5),
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
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
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
                  ),
                  const SizedBox(height: 20),

                  // زر تسجيل الدخول
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: themeData.whitecolor
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: themeData.whitecolor,
                          fontFamily: 'MVBoli',
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // خط فاصل مع نص
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Colors.white54,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
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
                  const SizedBox(height: 20),

                  // أزرار تسجيل الدخول الاجتماعي
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // زر تسجيل الدخول بواسطة Google
                      Container(
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google_icon.png',
                            height: 30,
                            width: 30,
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
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 100),
                      // زر تسجيل الدخول بواسطة Facebook
                      Container(
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 24,
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
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // زر الرجوع
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white70, width: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 8,
                          ),
                        ),
                        child: const Text('Back',
                        style: TextStyle(
                          fontFamily: 'MVBoli',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// حذف دوال المساعدة غير المستخدمة
}