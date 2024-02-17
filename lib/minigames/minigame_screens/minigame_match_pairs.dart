import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';

import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_text_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_text_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_date_tile.dart';

class MinigameMatchPairs extends StatefulWidget {
  const MinigameMatchPairs(
      {super.key,
      required this.question,
      required this.currentProgress,
      required this.maxProgress});
  final String question;
  final int currentProgress;
  final int maxProgress;

  @override
  State<MinigameMatchPairs> createState() => _MinigameMatchPairs();
}

class _MinigameMatchPairs extends State<MinigameMatchPairs> {
  int _selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentProgress: widget.currentProgress,
        maxProgress: widget.maxProgress,
        minigameContent:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: false,
                tileImage: AssetImage('kazimierz-wielki.jpg'),
                tileText: 'kazimierz wielki',
                tileEventId: 1,
              ),
              MinigameImageTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: false,
                tileEventId: 1,
                tileImage: AssetImage('mieszko-I.jpg'),
              ),
            ],
          )),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                MinigameTextTile(
                  callback: (val) => setState(() => _selectedId = val),
                  disabled: true,
                  tileEventId: 1,
                  tileText: 'mieszko 1',
                ),
                MinigameDateTile(
                  callback: (val) => setState(() => _selectedId = val),
                  disabled: false,
                  tileEventId: 1,
                  tileDate: DateTime.parse("20240217"),
                ),
              ]))
        ]));
  }
}
