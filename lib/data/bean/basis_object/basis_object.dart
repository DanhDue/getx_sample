import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/utils/json_converter/focus_node_converter.dart';
import 'package:getx_sample/utils/json_converter/text_editing_controller_converter.dart';

part 'basis_object.freezed.dart';
part 'basis_object.g.dart';

@freezed
class BasisObject with _$BasisObject {
  factory BasisObject({
    int? index,
    @required String? basis,
    @required @TextEditingControllerJsonConverter() TextEditingController? editTextController,
    @FocusNodeJsonConverter() FocusNode? focusNode,
  }) = _BasisObject;

  factory BasisObject.fromJson(Map<String, dynamic> json) => _$BasisObjectFromJson(json);
}
