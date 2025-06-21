import 'package:flutter/material.dart';

class storyDetailsScreen extends StatelessWidget {
  final String title;

  const storyDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: const Image(
            image: AssetImage("assets/images/api_background.png.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 50,
          left: 25,
          child: SafeArea(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/arrow_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
