import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles.dart';

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
              Text(
                widget.question,
                style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              MinigameImageTile(
                    tileImage: const AssetImage('kazimierz-wielki.jpg'),
                    tileDate: DateTime.now()),
              MinigameImageTile(
                    tileImage: const AssetImage('mieszko-I.jpg'),
                    tileDate: DateTime.now()),
            ],
         
          ),

        ),
        ),
      );
  }
}
