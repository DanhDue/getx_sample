// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:getx_sample/utils/extensions/color_extension.dart';
import 'package:getx_sample/utils/extensions/string_ext.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorJsonConverter implements JsonConverter<Color?, String?> {
  const ColorJsonConverter();
  @override
  Color? fromJson(String? json) => json?.toColor();

  @override
  String? toJson(Color? object) => object?.toHexString();
}
