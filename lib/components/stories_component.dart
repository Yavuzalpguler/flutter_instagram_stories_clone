import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_story_clone/data/story_data.dart';
import 'package:instagram_story_clone/models/story_model.dart';

import '../StoryView/story_view.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.url,
    required this.size,
    required this.userName,
    required this.stories,
    required this.index,
  });
  final String url;
  final double size;
  final String userName;
  final List<Story> stories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showCupertinoModalPopup(
                barrierColor: Colors.black,
                context: context,
                builder: (context) => StoryView(
                      currentIndex: 0,
                      stories: storyListUser[index],
                    ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: CachedNetworkImage(
              imageUrl: url,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          userName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  const StoriesBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StoryItem(
                    url: storyListUser[index].user.profileImageUrl,
                    size: 60,
                    userName: storyListUser[index].user.name,
                    stories: storyListUser[index].story,
                    index: index),
              ],
            ),
          );
        },
        itemCount: storyListUser.length,
      ),
    );
  }
}
