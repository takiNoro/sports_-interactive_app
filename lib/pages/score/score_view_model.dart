import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sports_interactive_app/pages/score/socre_model.dart';

import '../../const.dart';
import '../../model/page_model.dart';
import '../../osc/osc.dart';
import 'package:http/http.dart' as http;

final scoreProvider = ChangeNotifierProvider.autoDispose<ScoreViewModel>(
  (ref) {
    return ScoreViewModel();
  },
);

enum ScoreRank {
  S,
  A,
  B,
  C,
}

class ScoreViewModel extends OSCModel {
  bool blurHidden = true;
  int timer = 10;
  bool timerFlag = false;
  ScoreData? data;

  Future<void> getScore() async {
    final url = Uri.http("localhost:8000", "/api/app/get/score");
    print("========================================");
    print(url);
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var list = jsonDecode(response.body);
    print("List Decode:${list}");
    print("first: ${list[0]}");
    print("score: ${list[0]["score"]}");
    var listFirst = list[0];
    String score = NumberFormat('#,##0').format(listFirst["score"]);
    String combo = NumberFormat('#,##0').format(listFirst["combo"]);
    String strike = NumberFormat('#,##0').format(listFirst["strike"]);
    String ball = NumberFormat('#,##0').format(listFirst["ball"]);
    String critical = NumberFormat('#,##0').format(listFirst["perfect"]);
    ScoreRank rank = ScoreRank.values[listFirst["rank"]];
    String rankImage = "img_SCORE_result-${rank.name}_tab.png";
    print(rankImage);
    data = ScoreData(score, combo, strike, ball, critical, rankImage);
  }

  void toggleBlur() {
    blurHidden = !blurHidden;
    notifyListeners();
  }

  void reset() {
    blurHidden = true;
    notifyListeners();
  }

  void timerSet() {
    if (timerFlag) {
      return;
    }
    timerFlag = true;
    timerStart();
  }

  void timerStart() {
    Future.delayed(Duration(seconds: 1), () {
      timer--;
      notifyListeners();
      if (timer > 0) {
        timerStart();
      } else {
        oscPageSend(PageIndex.rank);
        pageViewModel.navigateNextPage(Consts.pathRank);
        timerEnd();
      }
    });
  }

  void timerEnd() {
    Future.delayed(Duration(seconds: 5), () {
      timerFlag = false;
      timer = 10;
    });
  }
}
