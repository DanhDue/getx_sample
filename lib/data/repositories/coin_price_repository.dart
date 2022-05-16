import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/network_error.dart';
import 'package:getx_sample/data/remote/result.dart';

abstract class CoinPriceRepository {
  Future<Result<CoinPriceResponse?, NetworkError>> getCoinPrices(
      String? symbol);

  Future<CoinPriceResponse?> fetchBinanceCoinPriceByBTC();

  Future<BaseResponseObject<CoinPriceResponse>?>
      fetchBinanceCoinPriceByBTCFollowByBaseResponse();

  Future<CoinPriceResponse?> fetchBinanceCoinPriceByUSD();

  Future<Result<CoinPriceResponse?, NetworkError>> fetchCoinPriceByBTC();

  Future<Result<CoinPriceResponse?, NetworkError>> fetchCoinPriceByUSD();
}
