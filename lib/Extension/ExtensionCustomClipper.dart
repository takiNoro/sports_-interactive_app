import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

// 平行四辺形
class ParallelogramClipper extends CustomClipper<Path> {
  final double width;
  final double height;
  final double offset;

  ParallelogramClipper(this.width, this.height, this.offset); // 引数でオフセット値を取得

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(offset, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width - offset, height);
    path.lineTo(0.0, height);
    path.lineTo(offset, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

}

//台形 (戻るボタンとか)
class BackButtonClipper extends CustomClipper<Path> {
  final double width;
  final double height;
  final double angle;

  BackButtonClipper(this.width, this.height, this.angle);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(calculationX(), height);
    path.lineTo(0, height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  double calculationX() {
    double radian = angle * math.pi/180;
    double x = height/math.tan(radian);
    return x;
  }
}
