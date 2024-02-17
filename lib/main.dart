import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_higher_lower.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_match_pairs.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_trivia.dart';
import 'module/module_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      // Set the initial route to your segmented list module
      initialRoute: '/',
      routes: {
        // Define routes for different parts of your app
        '/': (context) =>
            const MinigameMatchPairs(
              currentProgress: 6,
              maxProgress: 10,
              question: 'kto zyl wczesniej',
            ), // SegmentedListModule as initial route
        // Add more routes if needed
      },
    );
  }
}
