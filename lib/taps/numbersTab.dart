import 'package:flutter/material.dart';

class numbersTab extends StatelessWidget {
  final List<Map<String, String>> numbersData = [
    {'number': '1', 'image': 'assets/numbers/1.png'},
    {'number': '2', 'image': 'assets/numbers/2.png'},
    {'number': '3', 'image': 'assets/numbers/3.png'},
    {'number': '4', 'image': 'assets/numbers/4.png'},
    {'number': '5', 'image': 'assets/numbers/5.png'},
    {'number': '6', 'image': 'assets/numbers/6.png'},
    {'number': '7', 'image': 'assets/numbers/7.png'},
    {'number': '8', 'image': 'assets/numbers/8.png'},
    {'number': '9', 'image': 'assets/numbers/9.png'},
    {'number': '10', 'image': 'assets/numbers/10.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = 3;
    final spacing = 12.0;
    final itemWidth = (screenWidth - (spacing * (crossAxisCount + 1))) / crossAxisCount;
    final itemHeight = itemWidth + 10;

    return Container(
      color: const Color(0xFFCDECC5),
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: numbersData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: itemWidth / itemHeight,
        ),
        itemBuilder: (context, index) {
          final item = numbersData[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              item['image']!,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
