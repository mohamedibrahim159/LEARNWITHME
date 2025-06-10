import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/genderscreen_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.0001),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: themeData.whitecolor, width: 3),
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Text('Skip', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: const Text(
                    "What are your kid's gender\nand name?",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'MVBoli',
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  width: size.width,
                  height: size.height * 0.35,
                  color: const Color(0xff89AFC9).withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _genderOption('Boy', 'assets/images/boy_image.png', size),
                      _genderOption('Girl', 'assets/images/girl_image.png', size),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name of Kid', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'MVBoli',fontWeight: FontWeight.w900)),

                      SizedBox(height: size.height * 0.015),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'prefer not answer',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(height: 0.07),
                        Container(
                          width: size.width * 0.29,
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: size.height * 0.03),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: size.height * 0.02,horizontal:size.width * 0.36 ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: themeData.whitecolor, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Next',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: themeData.whitecolor, width: 3),
                              borderRadius: BorderRadius.circular(19),
                            ),
                          ),
                          child: const Text('Back',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderOption(String gender, String imagePath, Size size) {
    bool selected = selectedGender == gender;

    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.015),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: size.width * 0.32,
                height: size.width * 0.32,
                decoration: BoxDecoration(
                  color: themeData.primarycolor.withOpacity(0.7),
                  shape: BoxShape.circle,
                  border: selected ? Border.all(color: themeData.babybluecolor, width: 5) : null,
                ),
              ),
              Positioned(
                top: -size.height * 0.02,
                child: Image.asset(imagePath, width: size.width * 0.45, height: size.height * 0.2),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.06),
          Text(gender, style: const TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'MVBoli', fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
