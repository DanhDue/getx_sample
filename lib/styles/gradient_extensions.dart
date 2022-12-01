import 'package:flutter/material.dart';
import 'package:getx_sample/generated/colors.gen.dart';
import 'package:getx_sample/styles/theme_extensions.dart';

class GradientExtension {
  late BuildContext? context;
  late ThemeExtensions? themeExtensions;

  static final GradientExtension _inst = GradientExtension._internal();

  GradientExtension._internal();

  factory GradientExtension(BuildContext context) {
    _inst.context = context;
    _inst.themeExtensions = context.themeExtensions;
    return _inst;
  }

  LinearGradient get headerGradient =>
      LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        themeExtensions?.smokyBlack.withOpacity(0.8) ?? LMSColors.smokyBlack,
        themeExtensions?.palmLeaf.withOpacity(0.24) ?? LMSColors.palmLeaf
      ]);

  LinearGradient get enableButtonGradient => LinearGradient(
          begin: const Alignment(-0.92, 0.19),
          end: const Alignment(-0.19, -0.27),
          colors: [
            themeExtensions?.apple ?? LMSColors.apple,
            themeExtensions?.apple ?? LMSColors.apple,
            themeExtensions?.dartmouthGreen ?? LMSColors.apple,
            themeExtensions?.dartmouthGreen ?? LMSColors.apple
          ]);

  LinearGradient get disableButtonGradient => LinearGradient(colors: [
        themeExtensions?.textLightGrey ?? LMSColors.textLightGrey,
        themeExtensions?.textLightGrey ?? LMSColors.textLightGrey,
        themeExtensions?.textGrey ?? LMSColors.textGrey,
        themeExtensions?.textGrey ?? LMSColors.textGrey
      ]);
}
