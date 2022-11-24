import 'package:cube_transition_plus/cube_transition_plus.dart';
import 'package:flutter/material.dart';
import 'package:instagram_story_clone/StoryView/components/story_item.dart';

import '../data/story_data.dart';

class StoryView extends StatefulWidget {
  const StoryView(
      {super.key, required this.currentIndex, required this.details});

  final int currentIndex;
  final UserStoryList details;
  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late PageController _pageController;
  late int _currentIndex;

  late UserStoryList _details;
  @override
  void initState() {
    super.initState();

    _currentIndex = widget.currentIndex;
    _details = widget.details;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: height,
          child: CubePageView(
            children: stories
                .map((item) => StoryItemView(
                      details: _details,
                      currentIndex: _currentIndex,
                    ))
                .toList(),
          ),
        ),
      ),
      // body: PageView.builder(
      //   controller: _pageController,
      //   itemCount: stories.length,
      //   itemBuilder: (context, index) {
      //     return StoryItemView(
      //       stories: _stories,
      //       currentIndex: _currentIndex,
      //     );
      //   },
      // ),
    );
  }
}


// Center(
//         child: SizedBox(
//           height: height,
//           child: CubePageView(
//             children: places
//                 .map(
//                   (item) => Image.network(
//                     item.url,
//                     height: height,
//                     fit: BoxFit.cover,
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ),