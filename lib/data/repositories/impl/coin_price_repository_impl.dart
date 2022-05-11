import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/remote/clients/coin_price_client.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
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
    CoinPriceResponse? _result;
    final _res =
        await NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
            route: const CoinPriceClient.price(CoinSymbol.SXPBTC),
            responseType: CoinPriceResponse());

    _res.when(success: (coinPrice) {
      _result = coinPrice;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
    });

    return _result;
  }

  @override
  Future<BaseResponseObject<CoinPriceResponse>?>
      fetchBinanceCoinPriceByBTCFollowByBaseResponse() async {
    BaseResponseObject<CoinPriceResponse>? _result;
    final _res = await NetworkExecutor.execute<
            BaseResponseObject<CoinPriceResponse>,
            BaseResponseObject<CoinPriceResponse>?>(
        route: const CoinPriceClient.price(CoinSymbol.SXPBTC),
        responseType: const BaseResponseObject<CoinPriceResponse>());

    _res.when(success: (coinPrice) {
      _result = coinPrice;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
    });

    return _result;
  }

  @override
  Future<CoinPriceResponse?> fetchBinanceCoinPriceByUSD() async {
    CoinPriceResponse? _result;
    final _res =
        await NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
            route: const CoinPriceClient.price(CoinSymbol.SXPUSDT),
            responseType: CoinPriceResponse());

    _res.when(success: (coinPrice) {
      _result = coinPrice;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
    });

    return _result;
  }

  @override
  Future<Result<CoinPriceResponse?, NetworkError>> fetchCoinPriceByBTC() {
    return NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
        route: const CoinPriceClient.price(CoinSymbol.SXPBTC),
        responseType: CoinPriceResponse());
  }

  @override
  Future<Result<CoinPriceResponse?, NetworkError>> fetchCoinPriceByUSD() {
    return NetworkExecutor.execute<CoinPriceResponse, CoinPriceResponse?>(
        route: const CoinPriceClient.price(CoinSymbol.SXPUSDT),
        responseType: CoinPriceResponse());
  }
}

/// [CoinSymbol] is the coin symbol. Ex: SXPBTC is price of SXP in BTC.
class CoinSymbol {
  static const String SXPBTC = 'SXPBTC';
  static const String SXPUSDT = 'SXPUSDT';
}
