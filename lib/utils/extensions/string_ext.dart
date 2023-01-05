// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'dart:ui';

import 'package:fimber/fimber.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getx_sample/utils/constants.dart';
import 'package:getx_sample/utils/date_time_utils.dart';
import 'package:intl/intl.dart';

extension StringExt on String? {
  bool isNotBlank() => this != null && this?.trim().isNotEmpty == true;

  Color? toColor() {
    var hexColor = this?.replaceAll("#", "");
    if (hexColor?.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor?.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return null;
  }

  bool isValidEmail() {
    if (this == null || this?.isBlank == true) {
      return false;
    }
    return RegExp(Constants.emailValidateReg).hasMatch(this ?? '');
  }

  bool isValidPhoneNumber() {
    if (this == null || this?.isBlank == true) {
      return false;
    }
    return RegExp(Constants.phoneValidateReg).hasMatch(this ?? '');
  }

  bool isBirthDayFormat({String? dateTimeFormat}) {
    if (this == null || this?.isBlank == true) {
      return false;
    }
    try {
      DateFormat(dateTimeFormat ?? DateTimeUtils.yMd).parse(this ?? '');
      return true;
    } on Exception catch (e) {
      e.printError();
      Fimber.e(e.toString());
      return false;
    }
  }
}
