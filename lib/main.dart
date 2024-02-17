import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_higher_lower/minigame_higher_lower.dart';

// Import your segmented list module file
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
            const ModuleView(), // SegmentedListModule as initial route
        // Add more routes if needed
      },
    );
  }
}
