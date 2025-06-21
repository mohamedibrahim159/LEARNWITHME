import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learnwithme/AnimalDetailScreen.dart';
import 'package:learnwithme/models/animals_model.dart';
import 'package:learnwithme/repos/animals_repo.dart';

class AnimalsTab extends StatefulWidget {
  const AnimalsTab({Key? key}) : super(key: key);

  @override
  State<AnimalsTab> createState() => _AnimalsTabState();
}

class _AnimalsTabState extends State<AnimalsTab> {
  late Future<List<AnimalsModel>> _animalsFuture;

  @override
  void initState() {
    super.initState();
    _animalsFuture = fetchAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimalsModel>>(
      future: _animalsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No animals found'));
        }

        final animals = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 25,
              crossAxisSpacing: 10,
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
                      builder: (context) => AnimalDetailScreen(
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
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const AnimalCard({Key? key, required this.imageUrl, required this.onTap}) : super(key: key);

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
              return const Center(child: CircularProgressIndicator());
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

Future<List<AnimalsModel>> fetchAnimals() async {
  try {
    final animals = await AnimalsRepo.fetchAnimals();
    return animals;
  } catch (e) {
    log('❌ Error fetching animals: $e');
    return [];
  }
}