import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class LetterDetailScreen extends StatefulWidget {
  final int letterId;

  const LetterDetailScreen({super.key, required this.letterId});

  @override
  State<LetterDetailScreen> createState() => _LetterDetailScreenState();
}

class _LetterDetailScreenState extends State<LetterDetailScreen> {
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // ✅ هنا البيانات المحلية
  final List<Map<String, dynamic>> lettersData = [
    {
      "letter_id": 1,
      "category_id": 1,
      "letter": "A",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/A.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/A.png",
      "category": null,
    },
    {
      "letter_id": 2,
      "category_id": 1,
      "letter": "B",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/B.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/B.png",
      "category": null,
    },
    {
      "letter_id": 3,
      "category_id": 1,
      "letter": "C",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/C.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/C.png",
      "category": null,
    },
    {
      "letter_id": 4,
      "category_id": 1,
      "letter": "D",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/D.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/D.png",
      "category": null,
    },
    {
      "letter_id": 5,
      "category_id": 1,
      "letter": "E",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/E.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/E.png",
      "category": null,
    },
    {
      "letter_id": 6,
      "category_id": 1,
      "letter": "F",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/F.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/F.png",
      "category": null,
    },
    {
      "letter_id": 7,
      "category_id": 1,
      "letter": "G",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/G.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/G.png",
      "category": null,
    },
    {
      "letter_id": 8,
      "category_id": 1,
      "letter": "H",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/H.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/H.png",
      "category": null,
    },
    {
      "letter_id": 9,
      "category_id": 1,
      "letter": "I",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/I.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/I.png",
      "category": null,
    },
    {
      "letter_id": 10,
      "category_id": 1,
      "letter": "J",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/J.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/J.png",
      "category": null,
    },
    {
      "letter_id": 11,
      "category_id": 1,
      "letter": "K",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/K.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/K.png",
      "category": null,
    },
    {
      "letter_id": 12,
      "category_id": 1,
      "letter": "L",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/L.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/L.png",
      "category": null,
    },
    {
      "letter_id": 13,
      "category_id": 1,
      "letter": "M",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/M.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/M.png",
      "category": null,
    },
    {
      "letter_id": 14,
      "category_id": 1,
      "letter": "N",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/N.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/N.png",
      "category": null,
    },
    {
      "letter_id": 15,
      "category_id": 1,
      "letter": "O",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/O.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/O.png",
      "category": null,
    },
    {
      "letter_id": 16,
      "category_id": 1,
      "letter": "P",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/P.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/P.png",
      "category": null,
    },
    {
      "letter_id": 17,
      "category_id": 1,
      "letter": "Q",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/Q.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/Q.png",
      "category": null,
    },
    {
      "letter_id": 18,
      "category_id": 1,
      "letter": "R",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/R.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/R.png",
      "category": null,
    },
    {
      "letter_id": 19,
      "category_id": 1,
      "letter": "S",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/S.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/S.png",
      "category": null,
    },
    {
      "letter_id": 20,
      "category_id": 1,
      "letter": "T",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/T.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/T.png",
      "category": null,
    },
    {
      "letter_id": 21,
      "category_id": 1,
      "letter": "U",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/U.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/U.png",
      "category": null,
    },
    {
      "letter_id": 22,
      "category_id": 1,
      "letter": "V",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/V.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/V.png",
      "category": null,
    },
    {
      "letter_id": 23,
      "category_id": 1,
      "letter": "W",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/W.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/W.png",
      "category": null,
    },
    {
      "letter_id": 24,
      "category_id": 1,
      "letter": "X",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/X.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/X.png",
      "category": null,
    },
    {
      "letter_id": 25,
      "category_id": 1,
      "letter": "Y",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/Y.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/Y.png",
      "category": null,
    },
    {
      "letter_id": 26,
      "category_id": 1,
      "letter": "Z",
      "audio_url": "https://hemdanmohamed44.runasp.net/audio/Alphabets/Z.mp3",
      "photo_url": "https://hemdanmohamed44.runasp.net/images/Alphabets/Z.png",
      "category": null,
    },
  ];
  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() => isPlaying = false);
    });
  }

  Future<void> _toggleSound() async {
    final selectedLetter = lettersData.firstWhere(
      (item) => item['letter_id'] == widget.letterId + 1,
      orElse: () => {},
    );

    final audioUrl = selectedLetter['audio_url'];
    log('\n\n URL: $audioUrl\n\n');
    if (audioUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No audio available for this letter')),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

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
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isLoading = false;
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log('Letter ID: ${widget.letterId}');
    log('Selected Letter: ${lettersData[widget.letterId]}');
    log('Selected Letter ID: ${widget.letterId + 1}');
    log(
      '\n\nSelected Letter Data: ${lettersData.firstWhere((item) => item['letter_id'] == widget.letterId + 1, orElse: () => {})}\n\n',
    );
    final selectedLetter = lettersData.firstWhere(
      (item) => item['letter_id'] == widget.letterId + 1,
      orElse: () => {},
    );

    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              // ✅ صورة الحرف من السيرفر
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(
                  selectedLetter['photo_url'] ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.error,
                        size: 40,
                        color: Colors.red,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                  width: size.width * 0.6,
                  height: size.width * 0.6,
                ),
              ),
              const SizedBox(height: 20),

              // ✅ صورة المثال من assets
              Image.asset(
                letterImages[selectedLetter['letter']] ?? '',
                fit: BoxFit.fill,
                width: size.width * 0.5,
                height: size.width * 0.5,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),

              const SizedBox(height: 20),

              // // ✅ الحرف نفسه
              // Text(
              //   selectedLetter['letter'] ?? '',
              //   style: const TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.red,
              //   ),
              // ),
              // const SizedBox(height: 20),

              // ✅ الكلمة
              Text(
                selectedLetter['letter'] != null
                    ? letterWords[selectedLetter['letter']] ?? ''
                    : '',
                style: const TextStyle(
                  fontSize: 24,
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
}

final Map<String, String> letterWords = {
  'A': 'Apple',
  'B': 'Boy',
  'C': 'Cat',
  'D': 'Dog',
  'E': 'Elephant',
  'F': 'Fish',
  'G': 'Gorilla',
  'H': 'Hippo',
  'I': 'Icecream',
  'J': 'Juice',
  'K': 'Kangaroo',
  'L': 'Lemon',
  'M': 'Monkey',
  'N': 'Nurse',
  'O': 'Orange',
  'P': 'Penguin',
  'Q': 'Queen',
  'R': 'Rabbit',
  'S': 'Sun',
  'T': 'Turtle',
  'U': 'Umbrella',
  'V': 'Vase',
  'W': 'Whale',
  'X': 'X-ray',
  'Y': 'Yoyo',
  'Z': 'Zebra',
};

final Map<String, String> letterImages = {
  'A': 'assets/Alphabets/Apple.png',
  'B': 'assets/Alphabets/boy.png',
  'C': 'assets/Alphabets/Cat.png',
  'D': 'assets/Alphabets/Dog.png',
  'E': 'assets/Alphabets/Elephant.png',
  'F': 'assets/Alphabets/Fish.png',
  'G': 'assets/Alphabets/Gorilla.png',
  'H': 'assets/Alphabets/Hippo.png',
  'I': 'assets/Alphabets/icecream.png',
  'J': 'assets/Alphabets/Juice.png',
  'K': 'assets/Alphabets/Kangaroo.png',
  'L': 'assets/Alphabets/Lemon.png',
  'M': 'assets/Alphabets/Monkey.png',
  'N': 'assets/Alphabets/Nurse.png',
  'O': 'assets/Alphabets/Orange.png',
  'P': 'assets/Alphabets/Penguin.png',
  'Q': 'assets/Alphabets/Queen.png',
  'R': 'assets/Alphabets/Rabbit.png',
  'S': 'assets/Alphabets/Sun.png',
  'T': 'assets/Alphabets/Turtle.png',
  'U': 'assets/Alphabets/umbrella.png',
  'V': 'assets/Alphabets/Vase.png',
  'W': 'assets/Alphabets/Whale.png',
  'X': 'assets/Alphabets/X-ray.png',
  'Y': 'assets/Alphabets/Yoyo.png',
  'Z': 'assets/Alphabets/Zebra.png',
};
