// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String toHexString(Color input, {bool alpha = false, bool short = false}) {
  final r = (input.red * 0xFF).floor() & 0xFF;
  final g = (input.green * 0xFF).floor() & 0xFF;
  final b = (input.blue * 0xFF).floor() & 0xFF;
  final a = (input.alpha * 0xFF).floor() & 0xFF;

  final isShort = short &&
      ((r >> 4) == (r & 0xF)) &&
      ((g >> 4) == (g & 0xF)) &&
      ((b >> 4) == (b & 0xF)) &&
      (!alpha || (a >> 4) == (a & 0xF));

  if (isShort) {
    final rgb =
        (r & 0xF).toRadixString(16) + (g & 0xF).toRadixString(16) + (b & 0xF).toRadixString(16);

    return alpha ? (a & 0xF).toRadixString(16) + rgb : rgb;
  } else {
    final rgb = r.toRadixString(16).padLeft(2, '0') +
        g.toRadixString(16).padLeft(2, '0') +
        b.toRadixString(16).padLeft(2, '0');

    return alpha ? a.toRadixString(16).padLeft(2, '0') + rgb : rgb;
  }
}
