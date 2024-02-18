import 'package:bitnbuildfront/minigames/minigame_screens/minigame_get_random_game.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_results.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_text_tile.dart';
import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';

import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_tile.dart';

class MinigameMatchPairsName extends StatefulWidget {
  const MinigameMatchPairsName(
      {super.key,
      required this.question,
      required this.currentProgress,
      required this.tileIds,
      required this.tileImages,
      required this.tileNames,
      required this.moduleId,
      required this.currentScore,
      required this.maxProgress});
  final String question;
  final int currentProgress;
  final List<int> tileIds;
  final Map<int, String> tileImages;
  final Map<int, String> tileNames;
  final int maxProgress;
  final int currentScore;
  final int moduleId;

  @override
  State<MinigameMatchPairsName> createState() => _MinigameMatchPairsName();
}

class _MinigameMatchPairsName extends State<MinigameMatchPairsName> {
  int selectedIdLeft = 0;
  int selectedIdRight = 0;
  int lastClicked = 0; // 0 - nothing 1 - left  2 - right

  List<int> tileIdsShuffled = [];

  bool _shuffled = false;
  bool _submitted = false;
  bool _all_done = false;

  Map<int, bool> pairedLeft = {};
  Map<int, bool> pairedRight = {};
  Map<int, int> pairIds = {};

  Map<int, int> whichInSeqLeft = {};
  Map<int, int> whichInSeqRight = {};

  Color _answerColor = Colors.black26;

  void callback_left(val) {
    setState(() {
      if (selectedIdLeft == val) {
        selectedIdLeft = 0;
        lastClicked = 0;
      } else if (lastClicked == 2) {
        selectedIdLeft = val;
        pairedLeft[selectedIdLeft] = true;
        pairedRight[selectedIdRight] = true;
        pairIds[selectedIdLeft] = selectedIdRight;
        whichInSeqLeft[selectedIdLeft] = pairIds.length;
        whichInSeqRight[selectedIdRight] = pairIds.length;
        lastClicked = 0;
      } else {
        selectedIdLeft = val;
        lastClicked = 1;
      }
      if (pairIds.length == 4) {
        _all_done = true;
        _answerColor = Colors.blue;
      }
    });
  }

  void callback_right(val) {
    setState(() {
      if (selectedIdRight == val) {
        selectedIdRight = 0;
        lastClicked = 0;
      } else if (lastClicked == 1) {
        selectedIdRight = val;
        pairedLeft[selectedIdLeft] = true;
        pairedRight[selectedIdRight] = true;
        pairIds[selectedIdLeft] = selectedIdRight;
        whichInSeqLeft[selectedIdLeft] = pairIds.length;
        whichInSeqRight[selectedIdRight] = pairIds.length;
        lastClicked = 0;
      } else {
        selectedIdRight = val;
        lastClicked = 2;
      }
      if (pairIds.length == 4) {
        _all_done = true;
        _answerColor = Colors.blue;
      }
    });
  }

  void _checkAnswer() {
    setState(() {
      if (!_submitted) {
        if (_all_done) {
          bool allGood = true;
          pairIds
              .forEach((key, value) => allGood = allGood && (key == value));
          if (allGood) {
            _answerColor = Colors.green;
          } else {
            _answerColor = Colors.red;
          }
          _submitted = true;
        }
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
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MinigameResults(
                        currentProgress: widget.currentProgress,
                        currentScore: _answerColor == Colors.green
                            ? widget.currentScore + 1
                            : widget.currentScore,
                        maxProgress: 10,
                      )));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (!_shuffled) {
        tileIdsShuffled = List.from(widget.tileIds);
        tileIdsShuffled.shuffle();
        _shuffled = true;
      }
    });
    for (final i in widget.tileIds) {
      if (pairedLeft[i] == null) {
        pairedLeft[i] = false;
      }
      if (pairedRight[i] == null) {
        pairedRight[i] = false;
      }
    }
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
                    children: [
                      ...[],
                      for (final i in widget.tileIds)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MinigameImageTile(
                                callback: callback_left,
                                disabled: pairedLeft[i]!,
                                tileImageURL: widget.tileImages[i]!,
                                tileEventId: i,
                              ),
                              Text(pairedLeft[i]! && whichInSeqLeft[i] != null
                                  ? "${whichInSeqLeft[i]}"
                                  : ""),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...[],
                      for (final i in tileIdsShuffled)
                        Expanded(
                          child: Column(
                            children: [
                              MinigameTextTile(
                                callback: callback_right,
                                disabled: pairedRight[i]!,
                                tileEventId: i,
                                tileText: widget.tileNames[i]!,
                              ),
                              Text(pairedRight[i]! && whichInSeqRight[i] != null
                                  ? "${whichInSeqRight[i]}"
                                  : ""),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
