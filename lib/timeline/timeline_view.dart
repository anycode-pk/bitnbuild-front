import 'package:bitnbuildfront/minigames/minigame_screens/minigame_get_random_game.dart';
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
      floatingActionButton: (moduleId != 1)
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => 
                randomNextGame(
                    currentProgress: 0,
                    maxProgress: 10,
                    currentScore: 0,
                    moduleId: moduleId,
                    wasPreviousAnswerCorrect: false)

                        ));

              },
              child: const Icon(Icons.gamepad),
            )
          : null,
    );
  }
}
