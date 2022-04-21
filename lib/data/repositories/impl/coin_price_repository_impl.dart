import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/remote/clients/coin_price_client.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/network_error.dart';
import 'package:getx_sample/data/remote/result.dart';
import 'package:getx_sample/data/repositories/coin_price_repository.dart';

class CoinPriceRepositoryImpl extends CoinPriceRepository {
  @override
  Future<Result<List<CoinPriceResponse?>?, NetworkError>> getCoinPrices(
      String? symbol) async {
    return NetworkExecutor.execute<CoinPriceResponse,
            List<CoinPriceResponse?>?>(
        route: CoinPriceClient.price(), responseType: CoinPriceResponse());
  }
}
