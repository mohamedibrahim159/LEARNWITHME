import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class NumberDetailScreen extends StatefulWidget {
  final int numberId;

  const NumberDetailScreen({super.key, required this.numberId});

  @override
  State<NumberDetailScreen> createState() => _NumberDetailScreenState();
}

class _NumberDetailScreenState extends State<NumberDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isLoading = false;

  final List<Map<String, dynamic>> numbersData = [
    {
      "number_id": 1,
      "number": "1",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/1.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/1.mp3",
    },
    {
      "number_id": 2,
      "number": "2",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/2.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/2.mp3",
    },
    {
      "number_id": 3,
      "number": "3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/3.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/3.mp3",
    },
    {
      "number_id": 4,
      "number": "4",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/4.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/4.mp3",
    },
    {
      "number_id": 5,
      "number": "5",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/5.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/5.mp3",
    },

    {
      "number_id": 6,
      "number": "6",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/6.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/6.mp3",
    },
    {
      "number_id": 7,
      "number": "7",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/7.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/7.mp3",
    },
    {
      "number_id": 8,
      "number": "8",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/8.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/8.mp3",
    },
    {
      "number_id": 9,
      "number": "9",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/9.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/9.mp3",
    },
    {
      "number_id": 10,
      "number": "10",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/10.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/10.mp3",
    },
  ];

  final Map<String, String> numberLocalImages = {
    '1': 'assets/numbers/1.png',
    '2': 'assets/numbers/2.png',
    '3': 'assets/numbers/3.png',
    '4': 'assets/numbers/4.png',
    '5': 'assets/numbers/5.png',
    '6': 'assets/numbers/6.png',
    '7': 'assets/numbers/7.png',
    '8': 'assets/numbers/8.png',
    '9': 'assets/numbers/9.png',
    '10': 'assets/numbers/10.png',
  };

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() => isPlaying = false);
    });
  }

  Future<void> _toggleSound() async {
    final selectedNumber = numbersData.firstWhere(
      (item) => item['number_id'] == widget.numberId + 1,
      orElse: () => {},
    );

    final audioUrl = selectedNumber['audio_url'];
    log('\n\nURL: $audioUrl\n\n');

    if (audioUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No audio available for this number')),
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      if (isPlaying) {
        await _audioPlayer.stop();
        setState(() {
          isPlaying = false;
          isLoading = false;
        });
      } else {
        await _audioPlayer.play(UrlSource(audioUrl));
        setState(() {
          isPlaying = true;
          isLoading = false;
        });
      }
    } catch (e) {
      log('Error playing audio: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error playing audio: $e')));
      }
      setState(() => isLoading = false);
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
    final selectedNumber = numbersData.firstWhere(
      (item) => item['number_id'] == widget.numberId + 1,
      orElse: () => {},
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: const Image(
              image: AssetImage("assets/images/api_background.png.jpeg"),
              fit: BoxFit.cover,
            ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),

              // ✅ صورة من الاصول
              Image.asset(
                numberLocalImages[selectedNumber['number']] ?? '',
                width: size.width * 0.8,
                height: size.width * 0.8,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                numbersName[widget.numberId]['number'] ?? '',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // ✅ زر تشغيل الصوت
              GestureDetector(
                onTap: isLoading ? null : _toggleSound,
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
                  child: Center(
                    child:
                        isLoading
                            ? const CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 3,
                            )
                            : Row(
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> numbersName = [
    {
      "number_id": 1,
      "number": "One",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/1.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/1.mp3",
    },
    {
      "number_id": 2,
      "number": "Two",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/2.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/2.mp3",
    },
    {
      "number_id": 3,
      "number": "Three",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/3.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/3.mp3",
    },
    {
      "number_id": 4,
      "number": "Four",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/4.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/4.mp3",
    },
    {
      "number_id": 5,
      "number": "Five",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/5.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/5.mp3",
    },
    {
      "number_id": 6,
      "number": "Six",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/6.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/6.mp3",
    },
    {
      "number_id": 7,
      "number": "Seven",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/7.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/7.mp3",
    },
    {
      "number_id": 8,
      "number": "Eight",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/8.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/8.mp3",
    },
    {
      "number_id": 9,
      "number": "Nine",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/9.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/9.mp3",
    },
    {
      "number_id": 10,
      "number": "Ten",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Numbers/10.png",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Numbers/10.mp3",
    },
  ];
}
