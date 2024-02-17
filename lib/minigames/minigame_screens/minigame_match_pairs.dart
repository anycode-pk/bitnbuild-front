import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';

import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_tile.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_date_tile.dart';

class MinigameMatchPairs extends StatefulWidget {
  const MinigameMatchPairs(
      {super.key,
      required this.question,
      required this.currentProgress,
      required this.tileIds,
      required this.maxProgress});
  final String question;
  final int currentProgress;
  final List<int> tileIds;
  final int maxProgress;

  @override
  State<MinigameMatchPairs> createState() => _MinigameMatchPairs();
}

class _MinigameMatchPairs extends State<MinigameMatchPairs> {
  int selectedIdLeft = 0;
  int selectedIdRight = 0;
  int lastClicked = 0; // 0 - nothing 1 - left  2 - right

  bool _submitted = false;

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
      print('clicked left');
      print('last clicked = $lastClicked');
      print('selectedidleft = $selectedIdLeft');
      print('selectedidright = $selectedIdRight');
      print('val = $val');
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
      print('clicked right');
      print('last clicked = $lastClicked');
      print('selectedidleft = $selectedIdLeft');
      print('selectedidright = $selectedIdRight');
      print('val = $val');
    });
  }

  void _checkAnswer() {
    setState(() {
      bool all_done = true;
      for (final p in pairedLeft.values) {
        all_done = all_done && p;
      }
      for (final p in pairedRight.values) {
        all_done = all_done && p;
      }
      if (all_done && !_submitted) {
        bool all_good = true;
        pairIds.forEach((key, value) => all_good = all_good && (key == value));
        if (all_good) {
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
                                tileImageURL:
                                    'https://picsum.photos/seed/picsum/200',
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
                      for (final i in widget.tileIds)
                        Expanded(
                          child: Column(
                            children: [
                              MinigameDateTile(
                                callback: callback_right,
                                disabled: pairedRight[i]!,
                                tileEventId: i,
                                tileDate: DateTime.parse("20240217"),
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
            child: Text("Submit"),
          ),
        ]));
  }
}
