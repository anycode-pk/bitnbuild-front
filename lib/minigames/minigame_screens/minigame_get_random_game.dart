import 'dart:convert';

import 'package:bitnbuildfront/minigames/minigame_screens/minigame_empty_game.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_higher_lower.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_match_pairs.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_match_pairs_name.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_results.dart';
import 'package:bitnbuildfront/minigames/minigame_screens/minigame_trivia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

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
  final response = await http.get(Uri.parse(
      'https://shirotsuma.pythonanywhere.com/game/image-date/$moduleId/4'));

  final List<dynamic> dataJson = await jsonDecode(response.body);
  for (int i = 0; i < 4; i++) {
    int id = dataJson[i]['id'];
    res.tileIds.add(id);
    res.tileImages[id] = dataJson[i]['image_url'];
    res.tileDates[id] = DateTime.parse("${dataJson[i]['date']}0000");
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
  final response = await http.get(Uri.parse(
      'https://shirotsuma.pythonanywhere.com/game/image-date/$moduleId/4'));

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
  
  int getAnswerId() { return answerId; }
  int getEvent1Id() { return event1Id; }
  String getEvent1URL() { return event1URL;} 
  String getEvent1Title() {return event1Title;}
  
  int getEvent2Id() { return event2Id;}
  String getEvent2URL() { return event2URL;}
  String getEvent2Title() { return event2Title;}

}

Future<HigherLowerData> getHigherLowerData(moduleId) async {
  HigherLowerData res = HigherLowerData();
  final response = await http.get(Uri.parse(
      'https://shirotsuma.pythonanywhere.com/game/higher-lower/$moduleId'));

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
  String getCorrectAnswer() {return correctAnswer;}
  List<String> getAnswers() {return answers;}
  String getQuestion() {return question;}
}

Future<TriviaData> getTriviaData(moduleId) async {
  TriviaData res = TriviaData();
  final response = await http.get(Uri.parse(
      'https://shirotsuma.pythonanywhere.com/game/higher-lower/$moduleId'));

  final List<dynamic> dataJson = await jsonDecode(response.body);
  res.correctAnswer = dataJson[0];
  for(int i = 0; i < 4; i++) {
    res.answers.add(dataJson[1][i]);
  }
  res.question = dataJson[2];
  return Future.value(res);
}

Widget getRandomNextGame(
  int currentProgress,
  int maxProgress,
  int currentScore,
  int moduleId,
  bool wasPreviousAnswerCorrect,
) {
  var gameId = Random().nextInt(3);
  switch (gameId) {
    case 0:
      return FutureBuilder<TriviaData>(
        future: getTriviaData(moduleId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return MinigameTrivia(
              currentProgress: currentProgress + 1,
              currentScore:
              wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              moduleId: moduleId,
              answers: snapshot.data!.getAnswers(),
              correctAnswer: snapshot.data!.getCorrectAnswer(),
              maxProgress: 10,
              question: snapshot.data!.getQuestion(),
            );
          } else {
            return MinigameEmptyGame(
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              maxProgress: 10,
              question: 'Match the pairs',
            );
          }
        },
      );
    case 1:
      return FutureBuilder<ImageDateData>(
        future: getImageDateData(moduleId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return MinigameMatchPairs(
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              moduleId: moduleId,
              tileIds: snapshot.data!.getTileIds(),
              tileImages: snapshot.data!.getTileImages(),
              tileDates: snapshot.data!.getTileDates(),
              maxProgress: 10,
              question: 'Match the pairs',
            );
          } else {
            return MinigameEmptyGame(
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              maxProgress: 10,
              question: 'Match the pairs',
            );
          }
        },
      );
    case 2:
      return FutureBuilder<HigherLowerData>(
        future: getHigherLowerData(moduleId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return MinigameHigherLower(
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              moduleId: moduleId,
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
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              maxProgress: 10,
              question: 'Which was earlier?',
            );
          }
        },
      );
    case 3:
      return FutureBuilder<ImageNameData>(
        future: getImageNameData(moduleId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return MinigameMatchPairsName(
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              moduleId: moduleId,
              tileIds: snapshot.data!.getTileIds(),
              tileImages: snapshot.data!.getTileImages(),
              tileNames: snapshot.data!.getTileNames(),
              maxProgress: 10,
              question: 'Match the pairs',
            );
          } else {
            return MinigameEmptyGame(
              currentProgress: currentProgress + 1,
              currentScore:
                  wasPreviousAnswerCorrect ? currentScore + 1 : currentScore,
              maxProgress: 10,
              question: 'Match the pairs',
            );
          }
        },
      );
    default:
      return MinigameResults(
          currentProgress: currentProgress,
          currentScore: currentScore,
          maxProgress: maxProgress);
  }
}
