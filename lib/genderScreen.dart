import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class genderScreen extends StatefulWidget {
  const genderScreen({super.key});

  @override
  State<genderScreen> createState() => _genderScreenState();
}

class _genderScreenState extends State<genderScreen> {
  String? selectedGender;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/genderscreen_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top section with Skip button and title
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Skip button at top right
                  Container(
                  alignment: AlignmentDirectional.topStart,
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: themeData.whitecolor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 2,
                        ),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
                  ],
                ),
              ),
              SizedBox(height: 34),
              // Title text
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "What are your kid's gender\nand name?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'MVBoli',
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Gender selection circles
              Container(
                width: double.infinity,
                height: 290,
                color: Color(0xff89AFC9).withOpacity(0.8),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildGenderOption('Boy', 'assets/images/boy_image.png'),
                    const SizedBox(width: 0),
                    _buildGenderOption('Girl', 'assets/images/girl_image.png'),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // Name input field
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'Name of Kid',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily:
                              'MVBoli', // تأكدي إنه مضاف في pubspec.yaml
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.5),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                        ),
                        child: TextField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 100),
              InkWell(
                onTap: () {

                },
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text(

                          'prefer not answer',
                          style: TextStyle(color: themeData.whitecolor, fontSize: 15,
                            height: 1
                          ),
                        ),
                        Divider(
                          color: themeData.whitecolor,
                          thickness: 1.5,
                          indent: 150,
                          endIndent: 150,
                          height: 2,
                        )
                      ],
                    ),


                  ],
                ),
              ),
              // Bottom buttons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    // Next button
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: themeData.whitecolor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Back button
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: themeData.whitecolor,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 2,
                            ),
                          ),
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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

  Widget _buildGenderOption(String gender, String imagePath) {
    final bool isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 140,
            height: 170,
            child: Stack(
              clipBehavior: Clip.none, // مهم علشان ميقصش الصورة
              alignment: Alignment.center,
              children: [
                // الدائرة
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeData.primarycolor.withOpacity(0.7),
                    border: Border.all(
                      color: isSelected ? themeData.babybluecolor : Colors.transparent,
                      width: 5.0,
                    ),
                  ),
                ),
                // صورة الطفل طالعة فوق
                Positioned(
                  top: -5,
                  child: Image.asset(
                    imagePath,
                    width: 200,
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Text(
            gender,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'MVBoli',
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }



  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
