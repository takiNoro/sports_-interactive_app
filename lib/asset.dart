import 'dart:ffi';

class Asset {
  static const String imageDirectory = "assets/images/";

  static String imagePath(String imageName) {
    return "$imageDirectory$imageName";
  }
}