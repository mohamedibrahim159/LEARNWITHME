import 'package:flutter/material.dart';
import 'package:learnwithme/home/presentation/models/animals_model.dart';
import 'package:learnwithme/home/data/repos/animals_repo.dart';
import '../taps/AnimalDetailScreen.dart';

class AnimalGridScreen extends StatelessWidget {
  const AnimalGridScreen({super.key});

  // final List<Map<String, String>> animals = const [
  //   {"name": "Cheeta", "image": "assets/Animals/cheeta.png"},
  //   {"name": "Cow", "image": "assets/Animals/cow.png"},
  //   {"name": "Dog", "image": "assets/Animals/dog.png"},
  //   {"name": "Duck", "image": "assets/Animals/Duck.png"},
  //   {"name": "Elephant", "image": "assets/Animals/elephant.png"},
  //   {"name": "Fish", "image": "assets/Animals/fish.png"},
  //   {"name": "Fox", "image": "assets/Animals/fox.png"},
  //   {"name": "Lion", "image": "assets/Animals/lion.png"},
  //   {"name": "Monkey", "image": "assets/Animals/monkey.png"},
  //   {"name": "Rabbit", "image": "assets/Animals/rabbit.png"},
  //   {"name": "Rooster", "image": "assets/Animals/rooster.png"},
  //   {"name": "Sheep", "image": "assets/Animals/sheep.png"},
  //   {"name": "Tiger", "image": "assets/Animals/tiger.png"},
  //   {"name": "Turtle", "image": "assets/Animals/turtle.png"},
  //   {"name": "Zebra", "image": "assets/Animals/zepra.png"},
  // ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF83C9F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildProfile(), _buildForParents()],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: FutureBuilder<List<AnimalsModel>>(
                    future: AnimalsRepo.fetchAnimals(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No animals found'));
                      }

                      final animals = snapshot.data!;

                      return GridView.builder(
                        itemCount: animals.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemBuilder: (context, index) {
                          final animal = animals[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => AnimalDetailScreen(
                                        animalId: animal.animalId,
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                animal.photoUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 70,
                color: const Color(0xFF2874F0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icons/profile.png',
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      'assets/icons/abc_icon.png',
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      'assets/icons/book_icon.png',
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      'assets/icons/numbers_icon.png',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 15,
            child: const Icon(Icons.person, size: 18, color: Colors.black),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learner',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text('Age 7-8', style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForParents() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: const [
          Icon(Icons.supervisor_account, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Text(
            'For parents',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
