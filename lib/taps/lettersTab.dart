import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learnwithme/home/presentation/models/letters_model.dart';
import 'package:learnwithme/home/data/repos/letters_repo.dart';
import 'LettersDetailScreen.dart';

class LettersTab extends StatefulWidget {
  const LettersTab({super.key});

  @override
  State<LettersTab> createState() => _LettersTabState();
}

final List<Map<String, String>> lettersData = [
  {'letter': 'A', 'image': 'Apple.png'},
  {'letter': 'B', 'image': 'boy.png'},
  {'letter': 'C', 'image': 'Cat.png'},
  {'letter': 'D', 'image': 'Dog.png'},
  {'letter': 'E', 'image': 'Elephant.png'},
  {'letter': 'F', 'image': 'Fish.png'},
  {'letter': 'G', 'image': 'Gorilla.png'},
  {'letter': 'H', 'image': 'Hippo.png'},
  {'letter': 'I', 'image': 'icecream.png'},
  {'letter': 'J', 'image': 'Juice.png'},
  {'letter': 'K', 'image': 'Kangaroo.png'},
  {'letter': 'L', 'image': 'Lemon.png'},
  {'letter': 'M', 'image': 'Monkey.png'},
  {'letter': 'N', 'image': 'Nurse.png'},
  {'letter': 'O', 'image': 'Orange.png'},
  {'letter': 'P', 'image': 'Penguin.png'},
  {'letter': 'Q', 'image': 'Queen.png'},
  {'letter': 'R', 'image': 'Rabbit.png'},
  {'letter': 'S', 'image': 'Sun.png'},
  {'letter': 'T', 'image': 'Turtle.png'},
  {'letter': 'U', 'image': 'umbrella.png'},
  {'letter': 'V', 'image': 'Vase.png'},
  {'letter': 'W', 'image': 'Whale.png'},
  {'letter': 'X', 'image': 'X-ray.png'},
  {'letter': 'Y', 'image': 'Yoyo.png'},
  {'letter': 'Z', 'image': 'Zebra.png'},
];

class _LettersTabState extends State<LettersTab> {
  late Future<List<LettersModel>> _lettersFuture;

  @override
  void initState() {
    super.initState();
    _lettersFuture = fetchLetters();
  }

  Future<List<LettersModel>> fetchLetters() async {
    try {
      final letters = await LettersRepo.fetchAllLetters();
      return letters;
    } catch (e) {
      log('❌ Error fetching letters: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final double cardSize = MediaQuery.of(context).size.width / 3.3;

    return FutureBuilder<List<LettersModel>>(
      future: _lettersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No letters found'));
        }

        // final lettersData = snapshot.data!;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            color: const Color(0xFFA4DC7C),
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: lettersData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = lettersData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => LetterDetailScreen(letterId: index),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: cardSize,
                    height: cardSize,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: cardSize,
                          height: cardSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/Alphabets/${lettersData[index]['image']!}',
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: -12,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.red,
                            child: Text(
                              item['letter'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
