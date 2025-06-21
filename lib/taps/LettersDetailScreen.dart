import 'package:flutter/material.dart';

class LetterDetailScreen extends StatelessWidget {
  const LetterDetailScreen({super.key, required String letter});

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
      ],
    );
  }
}
