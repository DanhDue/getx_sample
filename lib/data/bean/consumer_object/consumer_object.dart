import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/utils/json_converter/focus_node_converter.dart';
import 'package:getx_sample/utils/json_converter/text_editing_controller_converter.dart';

part 'consumer_object.freezed.dart';
part 'consumer_object.g.dart';

@freezed
class ConsumerObject with _$ConsumerObject {
  factory ConsumerObject({
    int? index,
    @required String? consumer,
    @required @TextEditingControllerJsonConverter() TextEditingController? editTextController,
    @FocusNodeJsonConverter() FocusNode? focusNode,
  }) = _ConsumerObject;

  factory ConsumerObject.fromJson(Map<String, dynamic> json) => _$ConsumerObjectFromJson(json);
}
