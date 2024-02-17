import 'package:flutter/material.dart';

// Import your segmented list module file
import 'module/module_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      // Set the initial route to your segmented list module
      initialRoute: '/',
      routes: {
        // Define routes for different parts of your app
        '/': (context) => ModuleView(), // SegmentedListModule as initial route
        // Add more routes if needed
      },
    );
  }
}
