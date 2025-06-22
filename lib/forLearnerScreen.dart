import 'package:flutter/material.dart';
import 'user_preferences.dart';
import 'MainScreen.dart';

class LearnerProfileScreen extends StatefulWidget {
  const LearnerProfileScreen({Key? key}) : super(key: key);

  @override
  State<LearnerProfileScreen> createState() => _LearnerProfileScreenState();
}

class _LearnerProfileScreenState extends State<LearnerProfileScreen> {
  int selectedAgeGroup = 2;
  String learnerName = "Learner 1";
  final List<String> ageGroups = ['Age 4-5', 'Age 6-7', 'Age 7-8'];

  void _editName() async {
    final controller = TextEditingController(text: learnerName);
    final result = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Edit Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Enter new name"),
              autofocus: true,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed:
                    () => Navigator.of(context).pop(controller.text.trim()),
                child: const Text("Save"),
              ),
            ],
          ),
    );
    if (result != null && result.isNotEmpty) {
      setState(() {
        learnerName = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF40C4C8),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalsScreen(),
                        ),
                      );
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.person,
                      color: Color(0xFF40C4C8),
                      size: 25,
                    ),
                    label: const Text(
                      'For parents',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF40C4C8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF40C4C8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.08),
                    Container(
                      width: size.width * 0.35,
                      height: size.width * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/child_pic.png',
                          width: size.width * 0.6,
                          height: size.width * 0.6,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.black54,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _editName,
                          child: const Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          learnerName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    const Text(
                      'Learner track active now',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: 'MVBoli',
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    ...List.generate(ageGroups.length, (index) {
                      final isSelected = selectedAgeGroup == index;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.1,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedAgeGroup = index;
                              UserPreferences.selectedAgeGroup =
                                  ageGroups[index];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                ageGroups[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child:
                                    isSelected
                                        ? const Icon(
                                          Icons.check,
                                          color: Color(0xff42D13C),
                                          size: 30,
                                        )
                                        : const SizedBox(width: 25),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
