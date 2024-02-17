import 'package:flutter/material.dart';

class MinigameProgressTracker extends StatefulWidget {
  const MinigameProgressTracker(
      {super.key, required this.currentProgress, required this.maxProgress});
  final int currentProgress;
  final int maxProgress;

  @override
  State<MinigameProgressTracker> createState() => _MinigameProgressTracker();
}

class _MinigameProgressTracker extends State<MinigameProgressTracker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: LinearProgressIndicator(
          value: widget.currentProgress / widget.maxProgress,
        ));
  }
}
