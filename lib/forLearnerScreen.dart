import 'package:flutter/material.dart';

class LearnerProfileScreen extends StatefulWidget {
  const LearnerProfileScreen({Key? key}) : super(key: key);

  @override
  State<LearnerProfileScreen> createState() => _LearnerProfileScreenState();
}

class _LearnerProfileScreenState extends State<LearnerProfileScreen> {
  int selectedAgeGroup = 2; // Default to Age 7-8 (index 2)

  final List<String> ageGroups = [
    'Age 4-5',
    'Age 6-7',
    'Age 7-8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40C4C8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top navigation with back button and "For parents" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      // Handle back navigation
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.person, color: Color(0xFF40C4C8), size: 25),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onPressed: () {
                      // Handle "For parents" action
                    },
                  ),
                ],
              ),
            ),

            // Learner profile section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),

                    // Astronaut avatar
                    Center(
                      child: Container(
                        width: 138,
                        height: 138,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/child_pic.png', // Replace with your actual asset path
                            width: 300,
                            height: 300,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback if image asset not found
                              return const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.black54,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Learner name with edit button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),

                        const Text(
                          'Learner 1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Learner track status
                    const Center(
                      child: Text(
                        'Learner track active now',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'MVBoli'
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Age group selection buttons
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ageGroups.length,
                      itemBuilder: (context, index) {
                        final bool isSelected = selectedAgeGroup == index;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30.0,left: 80,right: 80,top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedAgeGroup = index;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  ageGroups[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'MVBoli',
                                  ),
                                ),
                                // Reserve space for icon even if not selected
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: isSelected
                                      ? const Icon(
                                    Icons.check,
                                    color: Color(0xff42D13C),
                                    size: 30,
                                  )
                                      : const SizedBox(width: 25), // Empty space for unselected
                                ),
                              ],
                            ),

                          ),
                        );
                      },
                    ),
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
