import 'package:get/get.dart';
import 'package:getx_sample/data/repositories/coin_price_repository.dart';
import 'package:getx_sample/data/repositories/impl/coin_price_repository_impl.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut<CoinPriceRepository>(() => CoinPriceRepositoryImpl());
  }
}
