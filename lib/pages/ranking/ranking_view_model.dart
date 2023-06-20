import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sports_interactive_app/pages/ranking/ranking_model.dart';

import '../../const.dart';
import '../../model/page_model.dart';
import '../../osc/osc.dart';
import 'package:http/http.dart' as http;

final rankingProvider = ChangeNotifierProvider.autoDispose<RankingViewModel>(
      (ref) {
    return RankingViewModel();
  },
);

enum RankingRank {
  S,
  A,
  B,
  C,
}

class RankingViewModel extends OSCModel {
  bool blurHidden = true;
  int timer = 10;
  bool timerFlag = false;
  List<RankingData> data = [];

  Future<void> getRanking() async {
    final url = Uri.http("localhost:8000", "/api/get/ranking");
    final response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    List<RankingData> d = [];
    list.forEach((v) {
      String score = NumberFormat('#,##0').format(v["score"]);
      String rank = RankingRank.values[v["rank"]].name;
      RankingData rd = RankingData(rank, score);
      d.add(rd);
    });
    data = d;
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
    if(timerFlag) {
      return;
    }
    timerFlag = true;
    timerStart();
  }

  void timerStart() {
    Future.delayed(Duration(seconds: 1), ()
    {
      timer--;
      notifyListeners();
      if (timer > 0) {
        timerStart();
      } else {
        oscPageSend(PageIndex.top);
        pageViewModel.navigateNextPage(Consts.pathTop);
        timerEnd();
      }
    });
  }
  void timerEnd() {
    Future.delayed(Duration(seconds: 5), ()
    {
      timerFlag = false;
      timer = 10;
    });
  }
}