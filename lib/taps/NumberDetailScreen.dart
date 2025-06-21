import 'package:flutter/material.dart';

class numberDetailScreen extends StatelessWidget {
  final String letter;
  final String number;

  const numberDetailScreen({
    Key? key,
    required this.letter,
    required this.number,
  }) : super(key: key);

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
