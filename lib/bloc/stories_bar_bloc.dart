import 'dart:async';

import 'package:instagram_story_clone/bloc/bloc.dart';
import 'package:instagram_story_clone/data/story_data.dart';

class StoriesBarBloc implements Bloc {
  final _controller = StreamController<String?>();
  Sink<String?> get searchQuery => _controller.sink;
  Stream<String?> get searchQueryStream => _controller.stream;

  late Stream<List<UserStoryList>?> storiesStream;

  StoriesBarBloc() {
    storiesStream = _controller.stream
        .map((query) => query == null || query.isEmpty
            ? null
            : storyListUser
                .where((story) =>
                    story.user.name.toLowerCase().contains(query.toLowerCase()))
                .toList())
        .asBroadcastStream();
  }

  @override
  void dispose() {
    _controller.close();
  }
}
