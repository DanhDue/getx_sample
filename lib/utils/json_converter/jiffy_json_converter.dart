// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:fimber/fimber.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';

class JiffyJsonConverter implements JsonConverter<Jiffy?, String?> {
  const JiffyJsonConverter();

  @override
  Jiffy? fromJson(String? timestamp) {
    DateTime? result;
    try {
      result = DateTime.parse(timestamp ?? '');
    } on FormatException catch (exception) {
      Fimber.d(exception.message);
      exception.printError();
    }
    return result == null ? null : Jiffy(result);
  }

  @override
  String? toJson(Jiffy? date) => date?.format().toString();
}
