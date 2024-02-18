import 'dart:convert';
import 'dart:core';

import 'package:bitnbuildfront/minigames/minigame_screens/minigame_empty_game.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_higher_lower.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_match_pairs.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_match_pairs_name.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_results.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_trivia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

String uri = "https://shirotsuma.pythonanywhere.com";

class ImageDateData {
  List<int> tileIds = [];
  Map<int, String> tileImages = {};
  Map<int, DateTime> tileDates = {};

  List<int> getTileIds() {
    return tileIds;
  }

  Map<int, String> getTileImages() {
    return tileImages;
  }

  Map<int, DateTime> getTileDates() {
    return tileDates;
  }
}

Future<ImageDateData> getImageDateData(moduleId) async {
  ImageDateData res = ImageDateData();
  var response = await http.get(Uri.parse(
      '$uri/game/image-date/$moduleId/4'));

  final List<dynamic> dataJson = await jsonDecode(response.body);
  for (int i = 0; i < 4; i++) {
    int id = dataJson[i]['id'];
    res.tileIds.add(id);
    res.tileImages[id] = dataJson[i]['image_url'];
    res.tileDates[id] = DateTime.parse("${dataJson[i]['year']}0101");
  }
  return Future.value(res);
}

class ImageNameData {
  List<int> tileIds = [];
  Map<int, String> tileImages = {};
  Map<int, String> tileNames = {};

  List<int> getTileIds() {
    return tileIds;
  }

  Map<int, String> getTileImages() {
    return tileImages;
  }

  Map<int, String> getTileNames() {
    return tileNames;
  }
}

Future<ImageNameData> getImageNameData(moduleId) async {
  ImageNameData res = ImageNameData();
  var response = await http.get(Uri.parse(
      '$uri/game/image-name/$moduleId/4'));

  final List<dynamic> dataJson = await jsonDecode(response.body);
  for (int i = 0; i < 4; i++) {
    int id = dataJson[i]['id'];
    res.tileIds.add(id);
    res.tileImages[id] = dataJson[i]['image_url'];
    res.tileNames[id] = dataJson[i]['title'];
  }
  return Future.value(res);
}

class HigherLowerData {
  int answerId = 0;

  int event1Id = 0;
  String event1URL = "";
  String event1Title = "";

  int event2Id = 0;
  String event2URL = "";
  String event2Title = "";

  int getAnswerId() {
    return answerId;
  }

  int getEvent1Id() {
    return event1Id;
  }

  String getEvent1URL() {
    return event1URL;
  }

  String getEvent1Title() {
    return event1Title;
  }

  int getEvent2Id() {
    return event2Id;
  }

  String getEvent2URL() {
    return event2URL;
  }

  String getEvent2Title() {
    return event2Title;
  }
}

Future<HigherLowerData> getHigherLowerData(moduleId) async {
  HigherLowerData res = HigherLowerData();
  var response = await http.get(Uri.parse(
      '$uri/game/higher-lower/$moduleId'));

  final List<dynamic> dataJson = await jsonDecode(response.body);
  res.answerId = dataJson[0]['id'];

  res.event1Id = dataJson[0]['id'];
  res.event1URL = dataJson[0]['image_url'];
  res.event1Title = dataJson[0]['title'];

  res.event2Id = dataJson[1]['id'];
  res.event2URL = dataJson[1]['image_url'];
  res.event2Title = dataJson[1]['title'];
  return Future.value(res);
}

class TriviaData {
  String correctAnswer = "";
  List<String> answers = [];
  String question = "";
  String getCorrectAnswer() {
    return correctAnswer;
  }

  List<String> getAnswers() {
    return answers;
  }

  String getQuestion() {
    return question;
  }
}

Future<TriviaData> getTriviaData(moduleId) async {
  TriviaData res = TriviaData();
  var response = await http.get(
      Uri.parse('$uri/game/trivia/$moduleId'));

  List<dynamic> dataJson = jsonDecode(response.body);
  res.correctAnswer = dataJson[0];
  for (int i = 0; i < 4; i++) {
    res.answers.add(dataJson[1][i]);
  }
  res.question = dataJson[2];
  return Future.value(res);
}

class randomNextGame extends StatefulWidget {
  const randomNextGame({
    super.key,
    required this.currentProgress,
    required this.maxProgress,
    required this.currentScore,
    required this.moduleId,
    required this.wasPreviousAnswerCorrect,
  });
  final int currentProgress;
  final int maxProgress;
  final int currentScore;
  final int moduleId;
  final bool wasPreviousAnswerCorrect;

  @override
  State<randomNextGame> createState() => _randomNextGameState();
}

class _randomNextGameState extends State<randomNextGame> {
  var gameId = Random().nextInt(3);
  @override
  Widget build(BuildContext context) {
    switch (gameId) {
      case 3:
        return FutureBuilder<TriviaData>(
          future: getTriviaData(widget.moduleId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MinigameTrivia(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                moduleId: widget.moduleId,
                answers: snapshot.data!.getAnswers(),
                correctAnswer: snapshot.data!.getCorrectAnswer(),
                maxProgress: 10,
                question: snapshot.data!.getQuestion(),
              );
            } else {
              return MinigameEmptyGame(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                maxProgress: 10,
                question: 'Trivia',
              );
            }
          },
        );
      case 1:
        return FutureBuilder<ImageDateData>(
          future: getImageDateData(widget.moduleId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MinigameMatchPairs(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                moduleId: widget.moduleId,
                tileIds: snapshot.data!.getTileIds(),
                tileImages: snapshot.data!.getTileImages(),
                tileDates: snapshot.data!.getTileDates(),
                maxProgress: 10,
                question: 'Match the pairs',
              );
            } else {
              return MinigameEmptyGame(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                maxProgress: 10,
                question: 'Match the pairs',
              );
            }
          },
        );
      case 2:
        return FutureBuilder<HigherLowerData>(
          future: getHigherLowerData(widget.moduleId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MinigameHigherLower(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                moduleId: widget.moduleId,
                tile1Id: snapshot.data!.getEvent1Id(),
                tile1Title: snapshot.data!.getEvent1Title(),
                tile1Url: snapshot.data!.getEvent1URL(),
                tile2Id: snapshot.data!.getEvent2Id(),
                tile2Title: snapshot.data!.getEvent2Title(),
                tile2Url: snapshot.data!.getEvent2URL(),
                answerId: snapshot.data!.getAnswerId(),
                maxProgress: 10,
                question: 'Which was earlier?',
              );
            } else {
              return MinigameEmptyGame(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                maxProgress: 10,
                question: 'Which was earlier?',
              );
            }
          },
        );
      case 0:
        return FutureBuilder<ImageNameData>(
          future: getImageNameData(widget.moduleId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MinigameMatchPairsName(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                moduleId: widget.moduleId,
                tileIds: snapshot.data!.getTileIds(),
                tileImages: snapshot.data!.getTileImages(),
                tileNames: snapshot.data!.getTileNames(),
                maxProgress: 10,
                question: 'Match the pairs names',
              );
            } else {
              return MinigameEmptyGame(
                currentProgress: widget.currentProgress + 1,
                currentScore: widget.wasPreviousAnswerCorrect
                    ? widget.currentScore + 1
                    : widget.currentScore,
                maxProgress: 10,
                question: 'Match the pairs names',
              );
            }
          },
        );
      default:
        return MinigameResults(
            currentProgress: widget.currentProgress,
            currentScore: widget.currentScore,
            maxProgress: widget.maxProgress);
    }
  }
}
