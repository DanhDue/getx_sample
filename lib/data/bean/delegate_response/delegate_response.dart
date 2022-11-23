import 'package:freezed_annotation/freezed_annotation.dart';

import 'delegate.dart';

part 'delegate_response.freezed.dart';
part 'delegate_response.g.dart';

@freezed
class DelegateResponse with _$DelegateResponse {
  factory DelegateResponse({
    @JsonKey(name: 'data') Delegate? delegate,
  }) = _DelegateResponse;

  factory DelegateResponse.fromJson(Map<String, dynamic> json) => _$DelegateResponseFromJson(json);
}
