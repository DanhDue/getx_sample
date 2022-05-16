import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  factory Meta({
    bool? totalCountIsEstimate,
    int? count,
    int? pageCount,
    int? totalCount,
    String? next,
    String? previous,
    String? self,
    String? first,
    String? last,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
