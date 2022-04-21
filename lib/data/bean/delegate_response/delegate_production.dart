import 'package:freezed_annotation/freezed_annotation.dart';

part 'delegate_production.freezed.dart';
part 'delegate_production.g.dart';

@freezed
class DelegateProduction with _$DelegateProduction {
  factory DelegateProduction({
    double? approval,
  }) = _DelegateProduction;

  factory DelegateProduction.fromJson(Map<String, dynamic> json) =>
      _$DelegateProductionFromJson(json);
}
