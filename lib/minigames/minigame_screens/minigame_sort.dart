import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_text_tile.dart';

class MinigameSort extends StatefulWidget {
  const MinigameSort(
      {super.key,
      required this.question,
      required this.currentProgress,
      required this.currentScore,
      required this.maxProgress});
  final String question;
  final int currentProgress;
  final int maxProgress;
  final int currentScore;

  @override
  State<MinigameSort> createState() => _MinigameSort();
}

class _MinigameSort extends State<MinigameSort> {
  int _selectedId = 0;
  bool _submitted = false;
  Color _answerColor = Colors.blue;

  void _checkAnswer() {
    setState(() {
      if (!_submitted) {
        if (_selectedId == 100) {
          _answerColor = Colors.green;
        } else {
          _answerColor = Colors.red;
        }
        _submitted = true;
      }
    });
  }

  List<Widget> _spawnChildren() {
    return <Widget>[
      MinigameImageTextTile(
        key: const Key('0'),
          callback: (val) => setState(() => _selectedId = val),
          disabled: _submitted,
          tileImageURL: 'https://picsum.photos/seed/picsum/200',
          tileText: 'kazimierz wielki',
          tileEventId: 1,
      ),
      MinigameImageTextTile(
        key: const Key('1'),
        callback: (val) => setState(() => _selectedId = val),
        disabled: _submitted,
          tileImageURL: 'https://picsum.photos/seed/picsum/200',
        tileText: 'kazimierz wielki',
        tileEventId: 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentScore: widget.currentScore,
        currentProgress: widget.currentProgress,
        maxProgress: widget.maxProgress,
        minigameContent: Column(children: <Widget>[
         Expanded(
            child: 
            ReorderableListView(
              onReorder: (int a, int b) => {},
              children: _spawnChildren(), 
            ),
          ),
        
          FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(_answerColor),
            ),
            onPressed: _checkAnswer,
            child: const Text("Submit"),
          ),
        ]
      )
    );
  }
}
/*
                  child: ReorderableListView(
                    itemExtent: 200,
                      onReorder: (int oldIndex, int newIndex) => {},
                    children: <Widget>[
                  ],
                              ),
                              */