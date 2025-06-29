import 'package:flutter/material.dart';
import 'package:learnwithme/services/video_player_service.dart';

class StoryDetailsScreen extends StatelessWidget {
  final int storyId;

  StoryDetailsScreen({super.key, required this.storyId});

  final List<Map<String, dynamic>> stories = [
    {
      "story_id": 1,
      "category_id": 4,
      "title": "The Ugly Duckling",
      "video_url":
          "https://hemdanmohamed44.runasp.net/video/Stories/UglyDuckling.mp4",
      "photo_url":
          "https://hemdanmohamed44.runasp.net/images/Stories/UglyDuckling.png",
      "category": null,
    },
    {
      "story_id": 2,
      "category_id": 4,
      "title": "Rabbit and Clever Fox",
      "video_url":
          "https://hemdanmohamed44.runasp.net/video/Stories/RabbitAndCleverFox.mp4",
      "photo_url":
          "https://hemdanmohamed44.runasp.net/images/Stories/RabbitAndCleverFox.png",
      "category": null,
    },
    {
      "story_id": 3,
      "category_id": 4,
      "title": "Proud Rabbit and Tortoise",
      "video_url":
          "https://hemdanmohamed44.runasp.net/video/Stories/ProudRabbitAndTortoise.mp4",
      "photo_url":
          "https://hemdanmohamed44.runasp.net/images/Stories/ProudRabbitAndTortoise.png",
      "category": null,
    },
    {
      "story_id": 4,
      "category_id": 4,
      "title": "Lion and Mouse",
      "video_url":
          "https://hemdanmohamed44.runasp.net/video/Stories/LionAndMouse.mp4",
      "photo_url":
          "https://hemdanmohamed44.runasp.net/images/Stories/LionAndMouse.png",
      "category": null,
    },
    {
      "story_id": 5,
      "category_id": 4,
      "title": "Amazing Voyages of Sindbad",
      "video_url":
          "https://hemdanmohamed44.runasp.net/video/Stories/AmazingVoyagesOfSindbad.mp4",
      "photo_url":
          "https://hemdanmohamed44.runasp.net/images/Stories/AmazingVoyagesOfSindbad.png",
      "category": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final story = stories.firstWhere(
      (s) => s['story_id'] == storyId,
      orElse: () => {},
    );

    if (story.isEmpty) {
      return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: const Image(
                image: AssetImage("assets/images/api_background.png.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: Text(
                'Story not found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: const Image(
            image: AssetImage("assets/images/api_background.png.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/icons/arrow_icon.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.white.withOpacity(0.2),
            //         shape: BoxShape.circle,
            //         border: Border.all(color: Colors.white.withOpacity(0.3)),
            //       ),
            //       child:GestureDetector(
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //         child: Image.asset(
            //           'assets/icons/arrow_icon.png',
            //           width: 24,
            //           height: 24,
            //           color: Colors.white,
            //         ),
            //       )
            //     ),
            //   ),
            // ],
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  // Story Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Story Image
                        // Container(
                        //   height: 200,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.black.withOpacity(0.3),
                        //         blurRadius: 20,
                        //         offset: const Offset(0, 10),
                        //       ),
                        //     ],
                        //   ),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(20),
                        //     child: Image.network(
                        //       story['photo_url'],
                        //       fit: BoxFit.cover,
                        //       errorBuilder: (context, error, stackTrace) {
                        //         return Container(
                        //           decoration: BoxDecoration(
                        //             gradient: LinearGradient(
                        //               colors: [
                        //                 Colors.purple.withOpacity(0.7),
                        //                 Colors.blue.withOpacity(0.7),
                        //               ],
                        //             ),
                        //             borderRadius: BorderRadius.circular(20),
                        //           ),
                        //           child: const Center(
                        //             child: Icon(
                        //               Icons.image_not_supported,
                        //               color: Colors.white,
                        //               size: 50,
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        // Story Title
                        Text(
                          story['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // const SizedBox(height: 8),
                        // Story Category
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 16,
                        //     vertical: 8,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     gradient: const LinearGradient(
                        //       colors: [Color(0xFF6B73FF), Color(0xFF9B59B6)],
                        //     ),
                        //     borderRadius: BorderRadius.circular(20),
                        //   ),
                        //   child: const Text(
                        //     'Children Story',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Video Player Container
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Column(
                          children: [
                            // Video Header
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF4682B4),
                                    Color(0xFF87CEEB),
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Watch Story',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text(
                                      'HD',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Video Player
                            Expanded(
                              child: Container(
                                // margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: VideoPlayerWidget(
                                    videoUrl: story['video_url'],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
