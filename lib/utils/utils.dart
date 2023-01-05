// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'dart:math';
import 'dart:ui';

import 'package:flutter/services.dart';

class Utils {
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }

  static Future<String?> loadJsonStringFromAsset(String? filePath) async {
    if (filePath == null || filePath.isEmpty) return null;
    return await rootBundle.loadString(filePath);
  }
}
