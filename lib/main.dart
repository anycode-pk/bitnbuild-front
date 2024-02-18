import 'package:flutter/material.dart';
import 'module/module_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline of History',
      // Set the initial route to your segmented list module
      initialRoute: '/',
      routes: {
        // Define routes for different parts of your app
        '/': (context) => const ModuleView()
           // SegmentedListModule as initial route
        // Add more routes if needed
      },
    );
  }
}
