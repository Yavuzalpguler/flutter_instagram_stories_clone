import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:instagram_story_clone/bloc/bloc_provider.dart';
import 'package:instagram_story_clone/bloc/stories_bar_bloc.dart';

import 'package:instagram_story_clone/components/instagram_header.dart';
import 'package:instagram_story_clone/components/stories_component.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var topPadding = mediaQueryData.padding.top;
    return BlocProvider<StoriesBarBloc>(
      bloc: StoriesBarBloc(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: topPadding / 2),
          child: Column(
            children: [
              const InstagramHeader(),
              const StoriesBarWidget(),
              const SizedBox(height: 80),
              FloatingActionButton(
                onPressed: () => HydratedBloc.storage.clear(),
                tooltip: 'Clear Storage',
                child: const Icon(Icons.delete_forever),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
