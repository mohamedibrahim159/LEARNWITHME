import 'package:flutter/material.dart';
import 'StoryDetailScreen.dart';

class storyTab extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      'title': 'الأرنب والثعلب المكار',
      'image': 'assets/Stories/abbitAndCleverFox.jpg',
    },
    {
      'title': 'الأسد والفأر',
      'image': 'assets/Stories/LionAndMouse.png',
    },
    {
      'title': 'الأرنب والسلحفاة',
      'image': 'assets/Stories/ProudRabbitAndTortoise.png',
    },
    {
      'title': 'البطة القبيحة',
      'image': 'assets/Stories/UglyDuckling.png',
    },
    {
      'title': 'رحلات سندباد المدهشة',
      'image': 'assets/Stories/AmazingVoyagesOfSindbad.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 0.5;

    return Container(
      color: const Color(0xFFB3E5FC),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => storyDetailsScreen(
                    title: story['title']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  story['image']!,
                  fit: BoxFit.cover,
                  width: screenWidth,
                  height: imageHeight,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
