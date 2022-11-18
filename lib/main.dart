import 'package:flutter/material.dart';

import 'package:instagram_story_clone/components/instagram_header.dart';
import 'package:instagram_story_clone/components/stories_component.dart';

void main() {
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var topPadding = mediaQueryData.padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: topPadding / 2),
        child: Column(
          children: const [
            InstagramHeader(),
            StoriesBarWidget(),
          ],
        ),
      ),
    );
  }
}
