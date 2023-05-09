import 'package:annotations/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_gen_text_response_object.freezed.dart';
part 'auto_gen_text_response_object.g.dart';

@freezed
@genJsonToThisOne
class AutoGenTextResponseObject with _$AutoGenTextResponseObject {
  factory AutoGenTextResponseObject({
    String? result,
  }) = _AutoGenTextResponseObject;

  factory AutoGenTextResponseObject.fromJson(Map<String, dynamic> json) =>
      _$AutoGenTextResponseObjectFromJson(json);
}
