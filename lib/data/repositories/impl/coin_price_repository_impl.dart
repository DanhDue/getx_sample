import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/remote/clients/coin_price_client.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/network_error.dart';
import 'package:getx_sample/data/remote/result.dart';
import 'package:getx_sample/data/repositories/coin_price_repository.dart';

class CoinPriceRepositoryImpl extends CoinPriceRepository {
  @override
  Future<Result<CoinPriceResponse?, NetworkError>> getCoinPrices(
      String? symbol) async {
    return NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
        route: CoinPriceClient.price(symbol),
        responseType: CoinPriceResponse());
  }

  @override
  Future<CoinPriceResponse?> fetchBinanceCoinPriceByBTC() async {
    final _res =
        await NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
            route: const CoinPriceClient.price(CoinSymbol.SXPBTC),
            responseType: CoinPriceResponse());

    _res.when(success: (coinPrice) {
      return coinPrice;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
      return null;
    });
  }

  @override
  Future<CoinPriceResponse?> fetchBinanceCoinPriceByUSD() async {
    final _res =
        await NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
            route: const CoinPriceClient.price(CoinSymbol.SXPUSDT),
            responseType: CoinPriceResponse());

    _res.when(success: (coinPrice) {
      return coinPrice;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
      return null;
    });
  }
}

/// [CoinSymbol] is the coin symbol. Ex: SXPBTC is price of SXP in BTC.
class CoinSymbol {
  static const String SXPBTC = 'SXPBTC';
  static const String SXPUSDT = 'SXPUSDT';
}
