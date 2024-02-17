import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_text_tile.dart';

class MinigameTrivia extends StatefulWidget {
  const MinigameTrivia(
      {super.key,
      required this.question,
      required this.answerId,
      required this.currentProgress,
      required this.maxProgress});
  final String question;
  final int answerId;
  final int currentProgress;
  final int maxProgress;

  @override
  State<MinigameTrivia> createState() => _MinigameTrivia();
}

class _MinigameTrivia extends State<MinigameTrivia> {
  int _selectedId = 0;
  bool _submitted = false;
  Color _answerColor = Colors.blue;

  void _checkAnswer() {
    setState(() {
      if (!_submitted) {
        if (_selectedId == widget.answerId) {
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
            Column(children: <Widget>[

Expanded(
  child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MinigameTextTile(
                        callback: (val) => setState(() => _selectedId = val),
                        disabled: _submitted,
                        tileText: 'kazimierz wielki',
                        tileEventId: 1,
                    ),
                    MinigameTextTile(
                      callback: (val) => setState(() => _selectedId = val),
                      disabled: _submitted,
                      tileText: 'kazimierz wielki',
                      tileEventId: 2,
                    ),
                ],
            )),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MinigameTextTile(
                      callback: (val) => setState(() => _selectedId = val),
                      disabled: _submitted,
                      tileText: 'kazimierz wielki',
                      tileEventId: 3,
                    ),
                    MinigameTextTile(
                      callback: (val) => setState(() => _selectedId = val),
                      disabled: _submitted,
                      tileText: 'kazimierz wielki',
                      tileEventId: 4,
                    ),
                ])),
          ])),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(_answerColor),
              ),
              onPressed: _checkAnswer,
              child: Text("Submit"),
            ),
        ]));
  }
}