import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modeSelectModelProvider = ChangeNotifierProvider((ref) => modeSelectModel());

enum Mode {
  story,
  battle,
}

class modeSelectModel extends ChangeNotifier{
  Mode? selectMode;

  void selectedMode(Mode mode) {
    selectMode = mode;
    notifyListeners();
  }

  bool validation() {
    return selectMode != null;
  }
}