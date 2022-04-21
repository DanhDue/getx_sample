import 'package:freezed_annotation/freezed_annotation.dart';

part 'delegate_forged.freezed.dart';
part 'delegate_forged.g.dart';

@freezed
class DelegateForged with _$DelegateForged {
  factory DelegateForged({
    String? fees,
    String? burnedFees,
    String? rewards,
    String? total,
  }) = _DelegateForged;

  factory DelegateForged.fromJson(Map<String, dynamic> json) =>
      _$DelegateForgedFromJson(json);
}
