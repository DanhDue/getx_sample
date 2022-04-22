import 'package:freezed_annotation/freezed_annotation.dart';

import '../interfaces/base_client_generator.dart';

part 'coin_price_client.freezed.dart';

@freezed
class CoinPriceClient extends BaseClientGenerator with _$CoinPriceClient {
  const CoinPriceClient._() : super();

  /// [symbol] is the coin symbol. Ex: SXPBTC is price of SXP in BTC.
  const factory CoinPriceClient.price(String? symbol) = _Price;

  @override
  String get baseURL => 'https://api.binance.com/api/v3/ticker/';

  @override
  Map<String, dynamic>? get body {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }

  @override
  Map<String, dynamic> get header => {"Content-Type": "application/json"};

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => 'GET',
    );
  }

  @override
  String get path {
    return when<String>(
      price: (symbol) => 'price?symbol=$symbol',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }
}
