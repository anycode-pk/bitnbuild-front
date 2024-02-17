import 'package:bitnbuildfront/timeline/timeline_list.dart';
import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const TimelineList(),
        ),
      ),
    );
  }
}
