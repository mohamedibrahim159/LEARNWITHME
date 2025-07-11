import 'package:flutter/material.dart';
import 'package:learnwithme/screens/user_preferences.dart';
import 'MainScreen.dart';

class ForParentScreen extends StatefulWidget {
  const ForParentScreen({super.key});

  @override
  State<ForParentScreen> createState() => _ForParentScreenState();
}

class _ForParentScreenState extends State<ForParentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF41D8DF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 80),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnimalsScreen()),
                    );
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white, size: 40),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Child zone",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'MVBoli',
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Image.asset(
              'assets/images/family.jpg',
              width: double.infinity,
              height: size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    _buildActivityRow("Animal", "assets/icons/dog_icon.png", size, UserPreferences.getAnimalCount()),
                    _buildActivityRow("Letters", "assets/icons/abc_icon.png", size, UserPreferences.getLettersCount()),
                    _buildActivityRow("Stories", "assets/icons/book_icon.png", size, UserPreferences.getStoriesCount()),
                    _buildActivityRow("Numbers", "assets/icons/numbers_icon.png", size, UserPreferences.getNumbersCount()),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5F0FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _buildOptionRow(Icons.download, "Save progress"),
                          _buildOptionRow(Icons.person, "Sign in"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityRow(String title, String iconPath, Size size, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(iconPath, width: size.width * 0.1),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "$count items learned",
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 10),
          Text(text),
          const Spacer(),
          const Icon(Icons.arrow_forward_outlined),
        ],
      ),
    );
  }
}
