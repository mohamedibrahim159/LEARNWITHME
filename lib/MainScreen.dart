import 'package:flutter/material.dart';
import 'package:learnwithme/taps/numbersTab.dart';
import 'package:learnwithme/taps/lettersTab.dart';
import 'package:learnwithme/taps/storyTab.dart';
import 'package:learnwithme/user_preferences.dart';
import 'forLearnerScreen.dart';
import 'taps/AnimalsTap.dart';
import 'package:flutter/services.dart';

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

  final List<List<Color>> tabGradients = [
    [Color(0xFFD5EECF), Color(0xFFC2E0BB)],
    [Color(0xFFBCE6FA), Color(0xFF91D5F0)],
    [Color(0xFFC7E9B0), Color(0xFFA1D98B)],
    [Color(0xFF4C99E0), Color(0xFF2A75C4)],
  ];

  final List<Color> tabAccentColors = [
    Color(0xFF6FA26D),
    Color(0xFF45A0C4),
    Color(0xFF74B35A),
    Color(0xFF2A75C4),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: tabGradients[selectedIndex],
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearnerProfileScreen(),
                            ),
                          );
                        },

                        child: _buildHeaderButton(
                          icon: Icons.person,
                          label: 'For parents',
                          isRightAligned: true,
                          width: screenWidth * 0.38,
                          color: tabAccentColors[selectedIndex],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearnerProfileScreen(),
                            ),
                          );
                        },
                        child: _buildHeaderButton(
                          icon: Icons.person,
                          label: 'Learner',
                          subLabel: UserPreferences.selectedAgeGroup,
                          isRightAligned: true,
                          width: screenWidth * 0.38,
                          color: tabAccentColors[selectedIndex],
                        ),
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
            color: tabAccentColors[selectedIndex].withOpacity(0.8),
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
              final iconSize =
                  isSelected ? screenWidth * 0.13 : screenWidth * 0.09;

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
    required Color color,
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
          if (!isRightAligned) Icon(icon, size: 20, color: color),
          if (!isRightAligned) const SizedBox(width: 8),
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
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (subLabel != null)
                  Text(subLabel, style: TextStyle(color: color, fontSize: 12)),
              ],
            ),
          ),
          if (isRightAligned) const SizedBox(width: 8),
          if (isRightAligned) Icon(icon, size: 20, color: color),
        ],
      ),
    );
  }
}
