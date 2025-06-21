import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:learnwithme/repos/animals_repo.dart';
import 'models/animals_model.dart';

class AnimalDetailScreen extends StatefulWidget {
  final int animalId;

  const AnimalDetailScreen({Key? key, required this.animalId}) : super(key: key);

  @override
  State<AnimalDetailScreen> createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  AnimalsModel? animal;
  bool isLoading = true;
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchAnimalData();
    _setupAudioPlayerListeners();
  }

  void _setupAudioPlayerListeners() {
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() => isPlaying = false);
    });
  }

  Future<void> fetchAnimalData() async {
    try {
      setState(() => isLoading = true);
      final animalData = await AnimalsRepo.fetchAnimalById(widget.animalId);
      if (animalData == null) throw Exception('Animal not found.');
      setState(() {
        animal = animalData;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading animal data: $e')),
        );
      }
    }
  }

  Future<void> _toggleSound() async {
    if (animal?.audioUrl == null) return;
    try {
      if (isPlaying) {
        await _audioPlayer.stop();
      } else {
        await _audioPlayer.play(UrlSource(animal!.audioUrl));
      }
      setState(() => isPlaying = !isPlaying);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error playing sound: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/api_background.png.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 50,
            left: 25,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/arrow_icon.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                if (animal?.photoUrl != null)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.network(
                        animal!.photoUrl,
                        fit: BoxFit.cover,
                        width: size.width * 0.75,
                        height: size.width * 0.75,
                      ),
                    ),
                  ),
                const SizedBox(height: 80),
                GestureDetector(
                  onTap: _toggleSound,
                  child: Container(
                    width: size.width * 0.6,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          isPlaying ? Icons.stop : Icons.play_arrow,
                          size: 35,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            color: Colors.green,
                            thickness: 2,
                            endIndent: isPlaying ? 0 : 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
