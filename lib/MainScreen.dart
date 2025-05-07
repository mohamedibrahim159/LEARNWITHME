import 'package:flutter/material.dart';
import 'package:learnwithme/lettersTab.dart';
import 'package:learnwithme/storyTab.dart';
import 'package:learnwithme/themeData.dart';
import 'AnimalsTab.dart';
import 'numbersTab.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final List<Widget> taps = [
    numbersTab(),
    storyTab(),
    lettersTab(),
    animalsTab(),
  ];

  final List<Color> backgroundColors = [
    Color(0xff3F7DBA), // Numbers
    Color(0xff4D9B5F), // Stories
    Color(0xff3DB7F0), // Letters
    Color(0xff86C588), // Animals
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4C99E0), Color(0xFF2A75C4)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: taps[selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            color: backgroundColors[selectedIndex].withOpacity(0.95),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              final iconPaths = [
                'assets/images/numbers_icon.png',
                'assets/images/book_icon.png',
                'assets/images/abc_icon.png',
                'assets/images/dog_icon.png',
              ];
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.only(top: 12.0),
                  child: Image.asset(
                    iconPaths[index],
                    width: isSelected ? 50 : 36,
                    height: isSelected ? 50 : 36,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderButton(
            icon: Icons.person,
            label: 'For parents',
            isRightAligned: true,
          ),
          _buildHeaderButton(
            icon: Icons.person,
            label: 'Learner',
            subLabel: 'Age 7-8',
            isRightAligned: true,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton({
    required IconData icon,
    required String label,
    String? subLabel,
    bool isRightAligned = false,
  }) {
    return Container(
      width: 150,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isRightAligned) Icon(icon, size: 20, color: Color(0xFF2A75C4)),
          if (!isRightAligned) SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isRightAligned
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Color(0xFF2A75C4),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (subLabel != null)
                  Text(
                    subLabel,
                    style: TextStyle(color: Color(0xFF2A75C4), fontSize: 12),
                  ),
              ],
            ),
          ),
          if (isRightAligned) SizedBox(width: 8),
          if (isRightAligned) Icon(icon, size: 20, color: Color(0xFF2A75C4)),
        ],
      ),
    );
  }
}
