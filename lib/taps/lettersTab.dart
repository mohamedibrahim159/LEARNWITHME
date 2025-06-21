import 'package:flutter/material.dart';

import 'LettersDetailScreen.dart';

class LettersTab extends StatelessWidget {
  final List<Map<String, String>> lettersData = [
    {'letter': 'A', 'image': 'apple.png'},
    {'letter': 'B', 'image': 'boy.png'},
    {'letter': 'C', 'image': 'cat.png'},
    {'letter': 'D', 'image': 'dog.png'},
    {'letter': 'E', 'image': 'elephant.png'},
    {'letter': 'F', 'image': 'fish.png'},
    {'letter': 'G', 'image': 'gorilla.png'},
    {'letter': 'H', 'image': 'hippo.png'},
    {'letter': 'I', 'image': 'icecream.png'},
    {'letter': 'J', 'image': 'juice.png'},
    {'letter': 'K', 'image': 'kangaroo.png'},
    {'letter': 'L', 'image': 'lemon.png'},
    {'letter': 'M', 'image': 'monkey.png'},
    {'letter': 'N', 'image': 'nurse.png'},
    {'letter': 'O', 'image': 'orange.png'},
    {'letter': 'P', 'image': 'Penguin.png'},
    {'letter': 'Q', 'image': 'queen.png'},
    {'letter': 'R', 'image': 'rabbit.png'},
    {'letter': 'S', 'image': 'sun.png'},
    {'letter': 'T', 'image': 'turtle.png'},
    {'letter': 'U', 'image': 'umbrella.png'},
    {'letter': 'V', 'image': 'vase.png'},
    {'letter': 'W', 'image': 'whale.png'},
    {'letter': 'X', 'image': 'x-ray.png'},
    {'letter': 'Y', 'image': 'yoyo.png'},
    {'letter': 'Z', 'image': 'zebra.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final double cardSize = MediaQuery.of(context).size.width / 3.3;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: const Color(0xFFA4DC7C),
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: lettersData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = lettersData[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LetterDetailScreen(
                      letter: item['letter']!,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: cardSize,
                height: cardSize,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: cardSize,
                      height: cardSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/Alphabets/${item['image']}',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: -12,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.red,
                        child: Text(
                          item['letter']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

