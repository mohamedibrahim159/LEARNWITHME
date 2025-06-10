import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  // قائمة الحيوانات
  final List<Map<String, dynamic>> animals = [
    {"name": "Lion", "image": "assets/animals/Lion.png"},
    {"name": "Tiger", "image": "assets/animals/Tiger.png"},
    {"name": "Sheep", "image": "assets/animals/Sheep.png"},
    {"name": "Cheetah", "image": "assets/animals/Cheetah.png"},
    {"name": "Fox", "image": "assets/animals/Fox.png"},
    {"name": "Rooster", "image": "assets/animals/Rooster.png"},
    {"name": "Duck", "image": "assets/animals/Duck.png"},
    {"name": "Elephant", "image": "assets/animals/Elephant.png"},
    {"name": "Cow", "image": "assets/animals/Cow.png"},
    {"name": "Dog", "image": "assets/animals/Dog.png"},
    {"name": "Rabbit", "image": "assets/animals/Rabbit.png"},
    {"name": "Monkey", "image": "assets/animals/Monkey.png"},
    {"name": "Zebra", "image": "assets/animals/Zebra.png"},
    {"name": "Fish", "image": "assets/animals/Fish.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC), // سماوي فاتح
      appBar: AppBar(
        backgroundColor: Color(0xFF81D4FA),
        elevation: 0,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Learner Info
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/icons/learner.png"),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Learner", style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text("Age 7-8", style: TextStyle(fontSize: 12, color: Colors.white)),
                  ],
                ),
              ],
            ),
            // For Parents Button
            ElevatedButton(
              onPressed: () {
                // TODO: فتح صفحة الآباء
              },
              child: Text("For parents"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: GridView.builder(
          itemCount: animals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final animal = animals[index];
            return GestureDetector(
              onTap: () {
                print("Pressed on ${animal['name']}");
                // TODO: افتح صفحة تفاصيل الحيوان أو استدعي API
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    animal['image'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/dog_icon.png'), size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/abc_icon.png'), size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/book_icon.png'), size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/numbers_icon.png'), size: 28),
            label: '',
          ),
        ],
      ),
    );
  }
}
