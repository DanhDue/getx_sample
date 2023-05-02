import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class FocusNodeJsonConverter implements JsonConverter<FocusNode?, String?> {
  const FocusNodeJsonConverter();

  @override
  FocusNode? fromJson(String? json) {
    return null;
  }

  @override
  String? toJson(FocusNode? object) {
    return object.toString();
  }
}
