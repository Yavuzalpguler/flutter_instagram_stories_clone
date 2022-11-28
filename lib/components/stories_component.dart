import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_story_clone/bloc/bloc_provider.dart';
import 'package:instagram_story_clone/bloc/stories_bar_bloc.dart';
import 'package:instagram_story_clone/data/story_data.dart';
import 'package:instagram_story_clone/models/story_model.dart';

import '../StoryView/story_view.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.storiesData,
    required this.size,
    required this.currentStory,
  });
  final double size;
  final List<UserStoryList>? storiesData;
  final UserStoryList currentStory;

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
                      details: storiesData,
                      currentStoryIndex: storiesData!.indexOf(currentStory),
                    ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: CachedNetworkImage(
              imageUrl: currentStory.user.profileImageUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          currentStory.user.name,
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
    final StoriesBarBloc bloc = BlocProvider.of<StoriesBarBloc>(context);
    bloc.searchQuery.add('Mock');
    return SizedBox(
      height: 105,
      child: StreamBuilder<List<UserStoryList>?>(
        stream: bloc.storiesStream,
        builder: (context, snapshot) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: StoryItem(
              size: 70,
              storiesData: snapshot.data,
              currentStory: snapshot.data![index],
            ),
          ),
        ),
      ),
    );
  }
}
