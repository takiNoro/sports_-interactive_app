import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tutorialProvider = ChangeNotifierProvider.autoDispose<TutorialViewModel>(
      (ref) {
    return TutorialViewModel();
  },
);

class TutorialViewModel extends ChangeNotifier {
  bool blurHidden = true;

  void toggleBlur() {
    blurHidden = !blurHidden;
    notifyListeners();
  }
  void reset() {
    blurHidden = true;
    notifyListeners();
  }
}