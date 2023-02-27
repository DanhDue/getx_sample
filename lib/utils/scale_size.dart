import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = Get.width;
    double val = (width / 1200) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
