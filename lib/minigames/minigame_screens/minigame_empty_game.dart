import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';

class MinigameEmptyGame extends StatefulWidget {
  const MinigameEmptyGame(
      {super.key,
      required this.question,
      required this.currentScore,
      required this.currentProgress,
      required this.maxProgress});
  final String question;
  final int currentProgress;
  final int maxProgress;
  final int currentScore;

  @override
  State<MinigameEmptyGame> createState() => _MinigameEmptyGame();
}

class _MinigameEmptyGame extends State<MinigameEmptyGame> {

  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentProgress: widget.currentProgress,
        maxProgress: widget.maxProgress,
        currentScore: widget.currentScore,
        minigameContent: const Icon(Icons.replay_circle_filled_sharp),
        );
  }
}
