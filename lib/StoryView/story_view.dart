import 'dart:async';

import 'package:cube_transition_plus/cube_transition_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:instagram_story_clone/StoryView/components/story_item.dart';
import 'package:instagram_story_clone/bloc/persist/stories_persist_bloc.dart';
import 'package:instagram_story_clone/bloc/persist/stories_persist_event.dart';
import 'package:instagram_story_clone/bloc/persist/stories_persist_model.dart';

import '../data/story_data.dart';

class StoryView extends StatefulWidget {
  const StoryView(
      {super.key, required this.details, required this.currentStoryIndex});

  final List<UserStoryList>? details;
  final int currentStoryIndex;
  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late List<UserStoryList>? _details;
  @override
  void initState() {
    super.initState();

    _details = widget.details;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final PageController controller = PageController();
    void initialPage() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (controller.hasClients) {
          controller.jumpToPage(widget.currentStoryIndex);
        }
      });
    }

    void scrollDownWithAnim(int index) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.animateTo(
          width * (index + 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      });
    }

    //Couldnt figure out how to add a call back to when te pageView is mounted, bad
    Timer(const Duration(milliseconds: 100), () => initialPage());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: height,
          child: CubePageView(
            controller: controller,
            children: _details != null
                ? _details!.asMap().entries.map((item) {
                    return BlocProvider<CounterBloc>(
                      create: (context) => CounterBloc(),
                      child: BlocBuilder<CounterBloc, List<StoriesPersist>>(
                          builder: (context, state) {
                        return StoryItemView(
                          details: item.value,
                          currentIndex: state
                              .firstWhere(
                                  (element) => element.id == item.value.id,
                                  orElse: () => StoriesPersist(
                                      id: item.value.id, currentIndex: 0))
                              .currentIndex,
                          onPress: () {
                            scrollDownWithAnim(item.key);
                          },
                          onTapDownBloc: (isForward, id) {
                            BlocProvider.of<CounterBloc>(context).add(
                              isForward
                                  ? CounterIncrementPressed(id)
                                  : CounterDecrementPressed(id),
                            );
                            // context
                            //     .read<CounterBloc>()
                            //     .add(CounterIncrementPressed());
                          },
                        );
                      }),
                    );
                  }).toList()
                : [],
          ),
        ),
      ),
    );
  }
}
