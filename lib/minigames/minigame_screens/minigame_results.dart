import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';

class MinigameResults extends StatefulWidget {
  const MinigameResults(
      {super.key,
      required this.currentProgress,
      required this.currentScore,
      required this.maxProgress});
  final int currentProgress;
  final int maxProgress;
  final int currentScore;

  @override
  State<MinigameResults> createState() => _MinigameResults();
}

class _MinigameResults extends State<MinigameResults> {
  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: "",
        currentProgress: widget.currentProgress+1,
        currentScore: widget.currentScore,
        maxProgress: widget.maxProgress,
        minigameContent: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text("Your score: ${100* widget.currentScore / widget.maxProgress}%",
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
