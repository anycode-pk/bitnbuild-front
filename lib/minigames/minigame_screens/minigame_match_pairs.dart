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
  int _selectedId_left = 0;
  int _selectedId_right = 0;
  bool _submitted = false;
  Color _answerColor = Colors.blue;

  void _checkAnswer() {
    setState(() {
      if (!_submitted) {
        if (_selectedId_left == _selectedId_right) {
          _answerColor = Colors.green;
        } else {
          _answerColor = Colors.red;
        }
        _submitted = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentProgress: widget.currentProgress,
        maxProgress: widget.maxProgress,
        minigameContent:
        Column(
          children: <Widget>[
        Expanded( child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId_left = val),
                disabled: false,
                tileImageURL: 'https://picsum.photos/seed/picsum/200',
                tileText: 'kazimierz wielki',
                tileEventId: 1,
              ),
              MinigameImageTile(
                callback: (val) => setState(() => _selectedId_left = val),
                tileImageURL: 'https://picsum.photos/seed/picsum/200',
                disabled: false,
                tileEventId: 2,
              ),
            ],
          )),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                MinigameTextTile(
                  callback: (val) => setState(() => _selectedId_right = val),
                  disabled: true,
                  tileEventId: 1,
                  tileText: 'mieszko 1',
                ),
                MinigameDateTile(
                  callback: (val) => setState(() => _selectedId_right = val),
                  disabled: false,
                  tileEventId: 2,
                  tileDate: DateTime.parse("20240217"),
                ),
              ]))
        ])), 
            FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(_answerColor),
              ),
              onPressed: _checkAnswer,
              child: Text("Submit"),
            ),
        ])
        );
  }
}
