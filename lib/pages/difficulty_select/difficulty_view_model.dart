import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/difficulty_model.dart';

final difficultyProvider = ChangeNotifierProvider.autoDispose<DifficultyViewModel>(
      (ref) {
    return DifficultyViewModel();
  },
);

class DifficultyViewModel extends ChangeNotifier {
  DifficultyIndex index = DifficultyIndex.none;

  void setIndex(DifficultyIndex index) {
    this.index = index;
    notifyListeners();
  }
  void reset() {
    this.index = DifficultyIndex.none;
    notifyListeners();
  }
}