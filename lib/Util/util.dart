import 'dart:core';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;


class Util {
  double parallelogramOffset(double height, double angle) {
    double radian = angle * math.pi / 180;
    double x = height * math.tan(radian);
    return x.w;
  }
}