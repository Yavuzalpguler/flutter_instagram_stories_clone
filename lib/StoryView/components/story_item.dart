import 'package:flutter/material.dart';
import 'package:instagram_story_clone/StoryView/components/story_progress_bar.dart';

import '../../data/story_data.dart';

class StoryItemView extends StatefulWidget {
  const StoryItemView(
      {super.key, required this.stories, required this.currentIndex});

  final UserStoryList stories;
  final int currentIndex;
  @override
  State<StoryItemView> createState() => _StoryItemViewState();
}

class _StoryItemViewState extends State<StoryItemView>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  late UserStoryList _stories;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _stories = widget.stories;
    _currentIndex = widget.currentIndex;
    _animationController = AnimationController(vsync: this);

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.stop();
        _animationController!.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.story.length) {
            _currentIndex += 1;
          } else {
            _currentIndex = 0;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: screenHeight - 100,
                width: screenWidth,
                child: Image.network(
                  _stories.story[_currentIndex].url,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 45.0,
                right: 10.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                  top: 15.0,
                  left: 10.0,
                  right: 10.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: widget.stories.story
                              .asMap()
                              .map((key, value) {
                                return MapEntry(
                                    key,
                                    AnimatedBar(
                                        animationController:
                                            _animationController!,
                                        position: key,
                                        currentindex: _currentIndex));
                              })
                              .values
                              .toList(),
                        ),
                      ])),
            ],
          ),
        ));
  }
}
