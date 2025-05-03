   import 'package:flutter/material.dart';
import 'package:learnwithme/themeData.dart';

class introScreen extends StatelessWidget {
     const introScreen({super.key});

     @override
     Widget build(BuildContext context) {
       return   Scaffold(
         body: Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/intro_background.jpg'), // صورة الخلفية
               fit: BoxFit.cover,
             ),
           ),
           child: SafeArea(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                     child: SingleChildScrollView(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           const SizedBox(height: 20),
                           // قائمة التقييمات
                           Container(
                             alignment: AlignmentDirectional.centerStart,
                             child: _buildTestimonialCard(
                               title: 'Joy for kid and parent',
                               content: 'A blessing for those parents who are at pains to make up their kid\'s screen-time. weeks my minor is in the app, and we keep counting.',
                               userName: 'Fouad yasser',
                               avatarColor: Colors.teal,
                               avatarText: 'F',
                             ),
                           ),
                           const SizedBox(height: 15),
                           Container(
                             alignment: AlignmentDirectional.centerEnd,
                             child: _buildTestimonialCard(

                               title: 'app is wonderful platform',
                               content: 'My picky daughter really enjoys the app, and I find the content and the overall feel it gives just amazing.',
                               userName: 'Etrefaag',
                               avatarColor: Colors.green,
                               avatarText: 'E',
                             ),
                           ),
                           const SizedBox(height: 15),
                           Container(
                             alignment: AlignmentDirectional.centerStart,
                             child: _buildTestimonialCard(
                               title: 'Great app',
                               content: 'pushes logic and memory up. puzzles vary in difficulty, and that adapts to your kid\'s learning pace. perfect!',
                               userName: 'Hamdan',
                               avatarColor: Colors.blue,
                               avatarText: 'H',
                             ),
                           ),
                           const SizedBox(height: 15),
                           _buildTestimonialCard(
                             title: 'thank you app',
                             content: 'the best app I\'ve seen so far. tons of fascinating puzzles. but the main thing is that kids do learn with it!',
                             userName: 'Mohamed',
                             avatarColor: Colors.amber,
                             avatarText: 'M',
                           ),
                           const SizedBox(height: 20),
                         ],
                       ),
                     ),
                   ),
                   // زر التالي
                   Padding(
                     padding: const EdgeInsets.only(bottom: 20.0),
                     child: SizedBox(
                       width: double.infinity,
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.transparent,
                           foregroundColor: Colors.transparent,
                           padding: const EdgeInsets.symmetric(vertical: 15),
                           shape: RoundedRectangleBorder(
                             side: BorderSide(
                               color: themeData.whitecolor
                             ),
                             borderRadius: BorderRadius.circular(35),
                           ),
                         ),
                         child: const Text(
                           'Next',
                           style: TextStyle(
                             fontSize: 25,
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   )
                 ],
               ),
             ),
           ),
         ),
       );
     }

     Widget _buildTestimonialCard({
       required String title,
       required String content,
       required String userName,
       required Color avatarColor,
       required String avatarText,
     }) {
       return Container(
         height: 150,
         width: 320,
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(15),
         ),
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 title,
                 style: const TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               const SizedBox(height: 4),
               Text(
                 content,
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.black.withOpacity(0.7),
                 ),
               ),
               const SizedBox(height: 8),
               Row(
                 children: [
                   CircleAvatar(
                     backgroundColor: avatarColor,
                     radius: 12,
                     child: Text(
                       avatarText,
                       style: const TextStyle(
                         color: Colors.white,
                         fontSize: 12,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   const SizedBox(width: 8),
                   Text(
                     userName,
                     style: TextStyle(
                       fontSize: 12,
                       color: Colors.black.withOpacity(0.5),
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
       );
     }
   }
