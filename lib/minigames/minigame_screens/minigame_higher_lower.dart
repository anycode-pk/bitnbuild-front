import 'package:flutter/material.dart';

import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_text_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_trivia.dart';

class MinigameHigherLower extends StatefulWidget {
  const MinigameHigherLower(
      {super.key,
      required this.question,
      required this.answerId,
      required this.currentProgress,
      required this.currentScore,
      required this.maxProgress});
  final String question;
  final int answerId;
  final int currentProgress;
  final int maxProgress;
  final int currentScore;

  @override
  State<MinigameHigherLower> createState() => _MinigameHigherLower();
}

class _MinigameHigherLower extends State<MinigameHigherLower> {
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
      } else {
        if (widget.currentProgress < widget.maxProgress) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.99, end: 1).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.ease,
                    ),
                  ),
                  child: child,
                );
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return MinigameTrivia(
                  currentProgress: widget.currentProgress + 1,
                  answerId: 3,
                  currentScore: _answerColor == Colors.green ? widget.currentScore+1 : widget.currentScore,
                  maxProgress: 10,
                  question: 'dopasuj pary',
                );
              },
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentProgress: widget.currentProgress,
        currentScore: widget.currentScore,
        maxProgress: widget.maxProgress,
        minigameContent: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: _submitted,
                tileImageURL: 'https://picsum.photos/seed/picsum/200',
                tileText: 'kazimierz wielki',
                tileEventId: 1,
              ),
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: _submitted,
                tileEventId: 2,
                tileImageURL: 'https://picsum.photos/seed/picsum/200',
                tileText: 'mieszko 1',
              ),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(_answerColor),
                ),
                onPressed: _checkAnswer,
                child: Text("Submit"),
              )
            ]));
  }
}
