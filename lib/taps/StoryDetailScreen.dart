import 'package:flutter/material.dart';

class storyDetailsScreen extends StatelessWidget {
  final String title;

  const storyDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: const Image(
        image: AssetImage("assets/images/api_background.png.jpeg"),
        fit: BoxFit.cover,
      ),
    );
  }
}
