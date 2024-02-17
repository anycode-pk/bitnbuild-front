import 'package:bitnbuildfront/minigames/minigame_progress_tracker.dart';
import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_text_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_text_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_tile.dart';


class MinigameHigherLower extends StatefulWidget {
  const MinigameHigherLower({super.key, required this.question});
  final String question;

  @override
  State<MinigameHigherLower> createState() => _MinigameHigherLower();
}

class _MinigameHigherLower extends State<MinigameHigherLower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              const MinigameProgressTracker(currentProgress: 2, maxProgress: 10),
              Text(
                widget.question,
                style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const MinigameImageTextTile(
                    tileImage: AssetImage('kazimierz-wielki.jpg'),
                    tileText: 'kazimierz wielki',
                    tileEventId: 1,
              ), 
              const MinigameImageTextTile(
                    tileEventId: 1,
                    tileImage: AssetImage('mieszko-I.jpg'),
                    tileText: 'mieszko 1',
              ),
              const MinigameImageTile(
                    tileEventId: 1,
                    tileImage: AssetImage('mieszko-I.jpg'),
              ),
              const MinigameTextTile(
                    tileEventId: 1,
                    tileText: 'mieszko 1',
              ),
            ],
         
          ),

        ),
        ),
      );
  }
}
