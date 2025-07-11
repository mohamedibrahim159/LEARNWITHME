import 'package:flutter/material.dart';
import 'package:learnwithme/screens/welcomeScreen.dart';
import 'package:video_player/video_player.dart';

class VideoSplashScreen extends StatefulWidget {
  @override
  _VideoSplashScreenState createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/splash/welcome_intro.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();

        // راقب انتهاء الفيديو تلقائيًا
        _controller.addListener(() {
          if (_controller.value.position >= _controller.value.duration &&
              !_controller.value.isPlaying) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => WelcomeScreen()),
            );
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // بدون شرط لأننا متأكدين إنه تم تهيئته
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
