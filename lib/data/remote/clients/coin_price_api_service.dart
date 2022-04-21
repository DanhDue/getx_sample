import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';

abstract class CoinPriceApiService {
  Future<List<CoinPriceResponse?>?> getCoinPrices();
}
