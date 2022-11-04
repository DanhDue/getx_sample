import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_price_response.freezed.dart';
part 'coin_price_response.g.dart';

@freezed
class CoinPriceResponse with _$CoinPriceResponse {
  factory CoinPriceResponse({
    String? symbol,
    String? price,
  }) = _CoinPriceResponse;

  factory CoinPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinPriceResponseFromJson(json);

  factory CoinPriceResponse.fromJsonObject(Object? json) =>
      _$CoinPriceResponseFromJson(json as Map<String, dynamic>);

  static List<CoinPriceResponse> createListFromJsonObject(Object? json) =>
      List<Object>.from(json as List)
          .map((e) => CoinPriceResponse.fromJson(e as Map<String, dynamic>))
          .toList();
}
