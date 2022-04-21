import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/remote/network_error.dart';
import 'package:getx_sample/data/remote/result.dart';

abstract class CoinPriceRepository {
  Future<Result<List<CoinPriceResponse?>?, NetworkError>> getCoinPrices(
      String? symbol);
}
