import 'package:annotations/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_object.freezed.dart';
part 'suggestion_object.g.dart';

@freezed
@genJsonToThisOne
class SuggestionObject with _$SuggestionObject {
  factory SuggestionObject({
    String? link,
    String? id,
    String? tieude,
  }) = _SuggestionObject;

  factory SuggestionObject.fromJson(Map<String, dynamic> json) =>
      _$SuggestionObjectFromJson(json);
}
