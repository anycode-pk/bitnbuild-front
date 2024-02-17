import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_progress_tracker.dart';

class MinigameGeneric extends StatefulWidget {
  const MinigameGeneric(
      {super.key,
      required this.question,
      required this.currentProgress,
      required this.maxProgress,
      required this.minigameContent});
  final String question;
  final int currentProgress;
  final int maxProgress;
  final Widget minigameContent;

  @override
  State<MinigameGeneric> createState() => _MinigameGeneric();
}

class _MinigameGeneric extends State<MinigameGeneric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MinigameProgressTracker(
                  currentProgress: widget.currentProgress,
                  maxProgress: widget.maxProgress),
              Text(
                widget.question,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(child: widget.minigameContent),
            ],
          ),
        ),
      ),
    );
  }
}
