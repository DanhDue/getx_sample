import 'package:freezed_annotation/freezed_annotation.dart';

part 'burned.freezed.dart';
part 'burned.g.dart';

@freezed
class Burned with _$Burned {
  factory Burned({
    String? fees,
    String? transactions,
    String? total,
  }) = _Burned;

  factory Burned.fromJson(Map<String, dynamic> json) => _$BurnedFromJson(json);
}
