import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:osc/osc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_interactive_app/model/difficulty_model.dart';
import '../Util/PageViewModel.dart';
import '../const.dart';
import 'package:udp/udp.dart';

import '../model/page_model.dart';

final oscModelProvider = ChangeNotifierProvider((ref) => OSCModel());

class OSCModel extends ChangeNotifier {
  Map<String, Map<String, String>> pageTags = {
    "top": {"domain": "/Page", "tag": "Title","route":"/top"},
    "difficulty": {"domain": "/Page", "tag": "Menu","route":"/difficulty"},
    "tutorial": {"domain": "/Page", "tag": "Tutorial","route":"/tutorial"},
    "play": {"domain": "/Page", "tag": "Skip","route":"/play"},
    "rank": {"domain": "/Page", "tag": "Ranking","route":"/score"},
  };
  int? score;

  List ranking = [];

  PageViewModel pageViewModel = PageViewModel();

  void oscReceive() async {

    final _socket = OSCSocket(serverPort: Consts.receivePort);
    await _socket.listen((msg) async {
      print(msg.address);
      pageViewModel.navigateNextPage("/${msg.arguments[0].toString()}");
      // score = int.parse(msg.arguments[0].toString());
      _socket.close();
      notifyListeners();
    });
  }

  void oscPageSend(PageIndex page) async {
    final prefs = await SharedPreferences.getInstance();
    _oscSend(pageTags[page.name]!["domain"]!, pageTags[page.name]!["tag"]!);
  }

  void oscDifficultySend(DifficultyIndex index) {
    switch (index) {
      case DifficultyIndex.none:
        break;
      case DifficultyIndex.easy:
        _oscSend("/Difficulty", "Easy");
        break;
      case DifficultyIndex.normal:
        _oscSend("/Difficulty", "Normal");
        break;
      case DifficultyIndex.hard:
        _oscSend("/Difficulty", "Hard");
        break;
    }
  }

  Future<void> _oscSend(String domain,String tag) async {

    const String _ip = "192.168.137.1";
    const int _sendPort = Consts.sendPort;
    var multicastEndpoint =
        Endpoint.multicast(InternetAddress(_ip), port: const Port(_sendPort));

    var sender = await UDP.bind(Endpoint.any());
    String _sendDomain = Consts.sendDomain;

    final message = OSCMessage(domain, arguments: [tag]);

    await sender.send(message.toBytes(), multicastEndpoint);
    sender.close();


    // Local
    var dataLength = await sender.send(
        message.toBytes(), Endpoint.broadcast(port: Port(8000)));
    sender.close();
  }
}
