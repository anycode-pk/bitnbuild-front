import 'package:bitnbuildfront/minigames/minigame_screens/minigame_get_random_game.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_results.dart';
import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_text_tile.dart';

class MinigameTrivia extends StatefulWidget {
  const MinigameTrivia(
      {super.key,
      required this.question,
      required this.answers,
      required this.correctAnswer,
      required this.currentScore,
      required this.currentProgress,
      required this.moduleId,
      required this.maxProgress});
  final String question;
  final String correctAnswer;
  final List<String> answers;
  final int currentProgress;
  final int moduleId;
  final int maxProgress;
  final int currentScore;

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
        if (widget.answers[_selectedId] == widget.correctAnswer) {
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
                return getRandomNextGame(
                    widget.currentProgress,
                    widget.maxProgress,
                    widget.currentScore,
                    widget.moduleId,
                    _answerColor == Colors.green);
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
        maxProgress: widget.maxProgress,
        currentScore: widget.currentScore,
        minigameContent: Column(children: <Widget>[
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MinigameTextTile(
                      callback: (val) => setState(() => _selectedId = val),
                      disabled: _submitted,
                      tileText: widget.answers[0],
                      tileEventId: 0,
                    ),
                    MinigameTextTile(
                      callback: (val) => setState(() => _selectedId = val),
                      disabled: _submitted,
                      tileText: widget.answers[1],
                      tileEventId: 1,
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
                      tileText: widget.answers[2],
                        tileEventId: 2,
                      ),
                      MinigameTextTile(
                        callback: (val) => setState(() => _selectedId = val),
                        disabled: _submitted,
                      tileText: widget.answers[3],
                        tileEventId: 3,
                      ),
                    ])),
              ])),
          FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(_answerColor),
            ),
            onPressed: _checkAnswer,
            child: Text(_submitted ? "Next question" : "Submit"),
          ),
        ]));
  }
}
