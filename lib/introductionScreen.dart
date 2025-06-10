import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/intro_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: size.height * 0.07),
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: _buildTestimonialCard(
                            title: 'Joy for kid and parent',
                            content: 'A blessing for those parents who are at pains to make up their kid\'s screen-time. weeks my minor is in the app, and we keep counting.',
                            userName: 'Fouad yasser',
                            avatarColor: Colors.teal,
                            avatarText: 'F',
                            size: size,
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.centerEnd,
                          child: _buildTestimonialCard(
                            title: 'app is wonderful platform',
                            content: 'My picky daughter really enjoys the app, and I find the content and the overall feel it gives just amazing.',
                            userName: 'Etrefaag',
                            avatarColor: Colors.green,
                            avatarText: 'E',
                            size: size,
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: _buildTestimonialCard(
                            title: 'Great app',
                            content: 'pushes logic and memory up. puzzles vary in difficulty, and that adapts to your kid\'s learning pace. perfect!',
                            userName: 'Hamdan',
                            avatarColor: Colors.blue,
                            avatarText: 'H',
                            size: size,
                          ),
                        ),
                        _buildTestimonialCard(
                          title: 'thank you app',
                          content: 'the best app I\'ve seen so far. tons of fascinating puzzles. but the main thing is that kids do learn with it!',
                          userName: 'Mohamed',
                          avatarColor: Colors.amber,
                          avatarText: 'M',
                          size: size,
                        ),
                        SizedBox(height: size.height * 0.02),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.021),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: themeData.whitecolor),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard({
    required String title,
    required String content,
    required String userName,
    required Color avatarColor,
    required String avatarText,
    required Size size,
  }) {
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.044,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.006),
          Text(
            content,
            style: TextStyle(
              fontSize: size.width * 0.038,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(height: size.height * 0.012),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: avatarColor,
                radius: size.width * 0.032,
                child: Text(
                  avatarText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Text(
                userName,
                style: TextStyle(
                  fontSize: size.width * 0.03,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
