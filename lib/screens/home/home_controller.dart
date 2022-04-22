import 'package:fimber/fimber.dart';
import 'package:get/get.dart';
import 'package:getx_sample/data/repositories/coin_price_repository.dart';
import 'package:getx_sample/screens/base/base_controller.dart';

class HomeController extends BaseController {
  final _coinPriceRepo = Get.find<CoinPriceRepository>();
  var coinInBTC = '0.00000000'.obs;
  var coinInUSD = '0.00000000'.obs;

  fetchBinanceCoinPriceByBTC() async {
    Fimber.d('fetchBinanceCoinPriceByBTC()');
    final _coinPrice = await _coinPriceRepo.fetchBinanceCoinPriceByBTC();
    coinInBTC.value = _coinPrice?.price ?? '';
  }

  fetchBinanceCoinPriceByUSD() async {
    Fimber.d('fetchBinanceCoinPriceByUSD()');
    final _coinPrice = await _coinPriceRepo.fetchBinanceCoinPriceByUSD();
    coinInUSD.value = _coinPrice?.price ?? '';
  }

}
