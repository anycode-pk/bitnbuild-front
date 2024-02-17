import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_text_tile.dart';

class MinigameTrivia extends StatefulWidget {
  const MinigameTrivia(
      {super.key,
      required this.question,
      required this.currentProgress,
      required this.maxProgress});
  final String question;
  final int currentProgress;
  final int maxProgress;

  @override
  State<MinigameTrivia> createState() => _MinigameTrivia();
}

class _MinigameTrivia extends State<MinigameTrivia> {
  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentProgress: widget.currentProgress,
        maxProgress: widget.maxProgress,
        minigameContent: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MinigameTextTile(
                    disabled: false,
                    tileText: 'kazimierz wielki',
                    tileEventId: 1,
                  ),
                  MinigameTextTile(
                    disabled: false,
                    tileText: 'kazimierz wielki',
                    tileEventId: 1,
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                  MinigameTextTile(
                    disabled: false,
                    tileText: 'kazimierz wielki',
                    tileEventId: 1,
                  ),
                  MinigameTextTile(
                    disabled: false,
                    tileText: 'kazimierz wielki',
                    tileEventId: 1,
                  ),
                  ]))
            ]));
  }
}
