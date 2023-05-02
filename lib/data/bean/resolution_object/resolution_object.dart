import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/utils/json_converter/focus_node_converter.dart';
import 'package:getx_sample/utils/json_converter/text_editing_controller_converter.dart';

part 'resolution_object.freezed.dart';
part 'resolution_object.g.dart';

@freezed
class ResolutionObject with _$ResolutionObject {
  factory ResolutionObject({
    int? index,
    String? resolution,
    @TextEditingControllerJsonConverter() TextEditingController? editTextController,
    @FocusNodeJsonConverter() FocusNode? focusNode,
  }) = _ResolutionObject;

  factory ResolutionObject.fromJson(Map<String, dynamic> json) => _$ResolutionObjectFromJson(json);
}
