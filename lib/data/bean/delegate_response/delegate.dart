import 'package:freezed_annotation/freezed_annotation.dart';

import 'delegate_blocks.dart';
import 'delegate_forged.dart';
import 'delegate_production.dart';

part 'delegate.freezed.dart';
part 'delegate.g.dart';

@freezed
class Delegate with _$Delegate {
  factory Delegate({
    String? username,
    String? address,
    String? publicKey,
    String? votes,
    int? rank,
    bool? isResigned,
    @JsonKey(name: 'blocks') DelegateBlocks? delegateBlocks,
    @JsonKey(name: 'production') DelegateProduction? delegateProduction,
    @JsonKey(name: 'forged') DelegateForged? delegateForged,
    String? version,
  }) = _Delegate;

  factory Delegate.fromJson(Map<String, dynamic> json) => _$DelegateFromJson(json);
}
