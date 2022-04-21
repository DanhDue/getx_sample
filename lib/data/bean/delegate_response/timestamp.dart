import 'package:freezed_annotation/freezed_annotation.dart';

part 'timestamp.freezed.dart';
part 'timestamp.g.dart';

@freezed
class Timestamp with _$Timestamp {
  factory Timestamp({
    int? epoch,
    int? unix,
    String? human,
  }) = _Timestamp;

  factory Timestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestampFromJson(json);
}
