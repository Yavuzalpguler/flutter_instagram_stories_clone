import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:instagram_story_clone/StoryView/components/story_progress_bar.dart';
import 'package:instagram_story_clone/models/story_model.dart';
import 'package:video_player/video_player.dart';

import '../../data/story_data.dart';

class StoryItemView extends StatefulWidget {
  const StoryItemView(
      {super.key,
      required this.details,
      required this.currentIndex,
      required this.onPress,
      required this.onTapDownBloc});

  final UserStoryList details;
  final int currentIndex;
  final Function onPress;
  final Function onTapDownBloc;

  @override
  State<StoryItemView> createState() => _StoryItemViewState();
}

class _StoryItemViewState extends State<StoryItemView>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  VideoPlayerController? _videoPlayerController;
  Function? _onPress;
  Function? _onTapDownBloc;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.currentIndex;
    _onPress = widget.onPress;
    _onTapDownBloc = widget.onTapDownBloc;
    _animationController = AnimationController(vsync: this);

    _loadStory(story: widget.details.story[_currentIndex], isNext: false);

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.stop();
        _animationController!.reset();

        if (mounted) {
          setState(() {
            if (_currentIndex + 1 < widget.details.story.length) {
              _currentIndex += 1;
              _loadStory(
                  story: widget.details.story[_currentIndex], isNext: false);
              _onTapDownBloc!(true, widget.details.id);
            } else {
              _currentIndex = 0;
              _loadStory(
                  story: widget.details.story[_currentIndex], isNext: true);
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _videoPlayerController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTapDown: (details) =>
              _onTapDown(details, widget.details.story[_currentIndex]),
          onLongPressDown: (details) =>
              _onLongPressDown(details, widget.details.story[_currentIndex]),
          onLongPressEnd: (details) =>
              _onLongPressEnd(details, widget.details.story[_currentIndex]),
          onVerticalDragUpdate: (details) => Navigator.of(context).pop(),
          child: Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Stack(
              children: [
                Container(
                    color: Colors.black,
                    height: screenHeight - 100,
                    width: screenWidth,
                    child: widget.details.story[_currentIndex].media ==
                            MediaType.image
                        ? CachedNetworkImage(
                            imageUrl: widget.details.story[_currentIndex].url,
                            fit: BoxFit.fill,
                          )
                        : (_videoPlayerController!.value.isInitialized)
                            ? FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width:
                                      _videoPlayerController!.value.size.width,
                                  height:
                                      _videoPlayerController!.value.size.height,
                                  child: VideoPlayer(_videoPlayerController!),
                                ),
                              )
                            : Stack(
                                alignment: Alignment.center,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                ],
                              )),
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
                            children: widget.details.story
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
                Positioned(
                  top: 45.0,
                  left: 10.0,
                  child: Column(
                    children: [
                      StoryOwnerItem(details: widget.details),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  left: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.reply,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenwidth / 3) {
      if (mounted) {
        setState(() {
          if (_currentIndex - 1 >= 0) {
            _currentIndex -= 1;
            _loadStory(
                story: widget.details.story[_currentIndex], isNext: false);
            _onTapDownBloc!(false, widget.details.id);
          }
        });
      }
    } else if (dx > 2 * screenwidth / 3) {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 < widget.details.story.length) {
            _currentIndex += 1;
            _loadStory(
                story: widget.details.story[_currentIndex], isNext: false);
            _onTapDownBloc!(true, widget.details.id);
          } else {
            _currentIndex = 0;
            _loadStory(
                story: widget.details.story[_currentIndex], isNext: true);
          }
        });
      }
    }
  }

  void _onLongPressDown(LongPressDownDetails details, Story story) {
    if (mounted) {
      if (story.media == MediaType.video) {
        if (_videoPlayerController!.value.isPlaying) {
          _videoPlayerController!.pause();
          _animationController!.stop();
        } else {
          _videoPlayerController!.play();
          _animationController!.forward();
        }
      } else {
        _animationController!.stop();
      }
    }
  }

  void _onLongPressEnd(LongPressEndDetails details, Story story) {
    if (mounted) {
      if (story.media == MediaType.video) {
        _videoPlayerController!.play();
        _animationController!.forward();
      } else {
        _animationController!.forward();
      }
    }
  }

  void _loadStory({required Story story, required bool isNext}) {
    if (mounted) {
      _animationController!.stop();
      _animationController!.reset();
      switch (story.media) {
        case MediaType.image:
          _animationController!.duration = const Duration(seconds: 5);
          _animationController!.forward();
          break;
        case MediaType.video:
          _videoPlayerController = VideoPlayerController.network(story.url)
            ..initialize().then((value) {
              if (_videoPlayerController!.value.isInitialized) {
                _animationController!.duration =
                    _videoPlayerController!.value.duration;
                _videoPlayerController!.play();
                _animationController!.forward();
              }
            });
          break;
        default:
      }

      if (isNext == true) {
        _onPress!();
      }
    }
  }
}

class StoryOwnerItem extends StatelessWidget {
  const StoryOwnerItem({
    super.key,
    required this.details,
  });

  final UserStoryList details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: CachedNetworkImageProvider(details.user.profileImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            Text(
              details.user.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              details.story[1].timeAgo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
