import 'package:bitnbuildfront/timeline/timeline_list.dart';
import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  final int moduleId;

  const TimelineView({super.key, required this.moduleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: TimelineList(
            moduleId: moduleId,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed functionality here
        },
        child: const Icon(Icons.gamepad),
      ),
    );
  }
}
