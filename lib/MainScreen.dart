import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learnwithme/AnimalDetailScreen.dart';
import 'package:learnwithme/models/animals_model.dart';
import 'package:learnwithme/repos/animals_repo.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

//  TODO: create the tab bar with 4 tabs and toggle between them

class _AnimalsScreenState extends State<AnimalsScreen>
    with SingleTickerProviderStateMixin {
  // Add a future variable to store the animals data
  late Future<List<AnimalsModel>> _animalsFuture;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the future in initState
    _animalsFuture = fetchAnimals();
  }

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
                  child: FutureBuilder<List<AnimalsModel>>(
                    future: _animalsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No animals found'));
                      }

                      final animals = snapshot.data!;

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1,
                              ),
                          itemCount: animals.length,
                          itemBuilder: (context, index) {
                            final animal = animals[index];
                            return AnimalCard(
                              imageUrl: animal.photoUrl,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => AnimalDetailScreen(
                                          animalId: animal.animalId,
                                        ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.only(
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

class AnimalCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const AnimalCard({Key? key, required this.imageUrl, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value:
                      loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: const Icon(Icons.pets, size: 40, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }
}

// get animals list
Future<List<AnimalsModel>> fetchAnimals() async {
  try {
    final List<AnimalsModel> animals = await AnimalsRepo.fetchAnimals();
    return animals;
  } catch (e) {
    log('❌ Error fetching animals: $e');
    return [];
  }
}
