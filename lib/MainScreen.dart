import 'package:flutter/material.dart';
import 'package:learnwithme/numbersTab.dart';
import 'package:learnwithme/lettersTab.dart';
import 'package:learnwithme/storyTab.dart';
import 'AnimalsTap.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  int selectedIndex = 3;

  final List<Widget> tabs = [
    numbersTab(),
    storyTab(),
    LettersTab(),
    AnimalsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4C99E0), Color(0xFF2A75C4)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderButton(
                        icon: Icons.person,
                        label: 'For parents',
                        isRightAligned: true,
                        width: screenWidth * 0.38,
                      ),
                      _buildHeaderButton(
                        icon: Icons.person,
                        label: 'Learner',
                        subLabel: 'Age 7-8',
                        isRightAligned: true,
                        width: screenWidth * 0.38,
                      ),
                    ],
                  ),
                ),
                Expanded(child: tabs[selectedIndex]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              final iconPaths = [
                'assets/icons/numbers_icon.png',
                'assets/icons/book_icon.png',
                'assets/icons/abc_icon.png',
                'assets/icons/dog_icon.png',
              ];
              final isSelected = index == selectedIndex;
              final iconSize = isSelected ? screenWidth * 0.13 : screenWidth * 0.09;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset(
                    iconPaths[index],
                    width: iconSize,
                    height: iconSize,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButton({
    required IconData icon,
    required String label,
    String? subLabel,
    bool isRightAligned = false,
    required double width,
  }) {
    return Container(
      width: width,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (!isRightAligned) Icon(icon, size: 20, color: Color(0xFF2A75C4)),
          if (!isRightAligned) const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: isRightAligned ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF2A75C4),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (subLabel != null)
                  Text(
                    subLabel,
                    style: const TextStyle(color: Color(0xFF2A75C4), fontSize: 12),
                  ),
              ],
            ),
          ),
          if (isRightAligned) const SizedBox(width: 8),
          if (isRightAligned) Icon(icon, size: 20, color: Color(0xFF2A75C4)),
        ],
      ),
    );
  }
}
