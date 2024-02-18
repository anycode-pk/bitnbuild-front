import 'package:bitnbuildfront/minigames/minigame_screens/minigame_get_random_game.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_results.dart';
import 'package:flutter/material.dart';

import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_text_tile.dart';

class MinigameHigherLower extends StatefulWidget {
  const MinigameHigherLower(
      {super.key,
      required this.question,
      required this.answerId,
      required this.currentProgress,
      required this.moduleId,
      required this.tile1Id,
      required this.tile1Url,
      required this.tile1Title,
      required this.tile2Id,
      required this.tile2Url,
      required this.tile2Title,
      required this.currentScore,
      required this.maxProgress});
  final String question;
  final int answerId;
  final int moduleId;
  final int currentProgress;
  final int maxProgress;
  final int currentScore;

  final int tile1Id;
  final String tile1Url;
  final String tile1Title;
  
  final int tile2Id;
  final String tile2Url;
  final String tile2Title;

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
                return randomNextGame(
                    currentProgress: widget.currentProgress,
                    maxProgress: widget.maxProgress,
                    currentScore: widget.currentScore,
                    moduleId: widget.moduleId,
                    wasPreviousAnswerCorrect: _answerColor == Colors.green);
              },
            ),
          );
        }
        else {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => MinigameResults(
            currentProgress: widget.currentProgress,
            currentScore: _answerColor == Colors.green ? widget.currentScore+1 : widget.currentScore,
            maxProgress: 10,
          ) 
          
          )
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
                tileImageURL: widget.tile1Url,
                tileText: widget.tile1Title,
                tileEventId: widget.tile1Id,
              ),
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: _submitted,
                tileImageURL: widget.tile2Url,
                tileText: widget.tile2Title,
                tileEventId: widget.tile2Id,
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
