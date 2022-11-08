import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/bean/meta/meta.dart';

part 'fullfiled_coin_price.freezed.dart';
part 'fullfiled_coin_price.g.dart';

@freezed
class FullfiledCoinPrice with _$FullfiledCoinPrice {
  factory FullfiledCoinPrice({
    String? status,
    String? message,
    Meta? meta,
    List<CoinPriceResponse>? data,
  }) = _FullfiledCoinPrice;

  factory FullfiledCoinPrice.fromJson(Map<String, dynamic> json) =>
      _$FullfiledCoinPriceFromJson(json);

  factory FullfiledCoinPrice.fromJsonObject(Object? json) =>
      _$FullfiledCoinPriceFromJson(json as Map<String, dynamic>);
}
