import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class GenericDetailScreen<T> extends StatefulWidget {
  final T data;
  final String Function(T) getTitle;
  final String Function(T) getImageUrl;
  final String? Function(T)? getAudioUrl;

  const GenericDetailScreen({
    Key? key,
    required this.data,
    required this.getTitle,
    required this.getImageUrl,
    this.getAudioUrl,
  }) : super(key: key);

  @override
  State<GenericDetailScreen<T>> createState() => _GenericDetailScreenState<T>();
}

class _GenericDetailScreenState<T> extends State<GenericDetailScreen<T>> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => isPlaying = false);
    });
  }

  Future<void> _toggleAudio() async {
    final audioUrl = widget.getAudioUrl?.call(widget.data);
    if (audioUrl == null) return;

    try {
      if (isPlaying) {
        await _audioPlayer.stop();
      } else {
        await _audioPlayer.play(UrlSource(audioUrl));
      }
      setState(() => isPlaying = !isPlaying);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error playing audio: $e')));
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
    final title = widget.getTitle(widget.data);
    final imageUrl = widget.getImageUrl(widget.data);

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: size.width * 0.75,
                    height: size.width * 0.75,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontFamily: 'MVBoli',
                  ),
                ),
                const SizedBox(height: 40),
                if (widget.getAudioUrl != null)
                  GestureDetector(
                    onTap: _toggleAudio,
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
