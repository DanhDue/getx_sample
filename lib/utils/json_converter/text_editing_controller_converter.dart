import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TextEditingControllerJsonConverter
    implements JsonConverter<TextEditingController?, String?> {
  const TextEditingControllerJsonConverter();

  @override
  TextEditingController? fromJson(String? json) {
    return null;
  }

  @override
  String? toJson(TextEditingController? object) {
    return object.toString();
  }
}
