import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp.dart';

part 'delegate_blocks_last.freezed.dart';
part 'delegate_blocks_last.g.dart';

@freezed
class DelegateBlocksLast with _$DelegateBlocksLast {
  factory DelegateBlocksLast({
    String? id,
    int? height,
    Timestamp? timestamp,
  }) = _DelegateBlocksLast;

  factory DelegateBlocksLast.fromJson(Map<String, dynamic> json) =>
      _$DelegateBlocksLastFromJson(json);
}
