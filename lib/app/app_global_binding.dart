import 'package:get/get.dart';
import 'package:getx_sample/data/bean/block_chain/block_chain.dart';
import 'package:getx_sample/data/local/storage_helper.dart';
import 'package:getx_sample/data/local/storage_helper_impl.dart';
import 'package:getx_sample/data/remote/clients/coin_api_service.dart';
import 'package:getx_sample/data/remote/clients/coin_api_service_impl.dart';
import 'package:getx_sample/data/remote/clients/coin_price_api_service.dart';
import 'package:getx_sample/data/remote/clients/coin_price_api_service_impl.dart';
import 'package:hive/hive.dart';

class AppGlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CoinApiService>(CoinApiServiceImpl(), permanent: true);
    Get.put<CoinPriceApiService>(CoinPriceApiServiceImpl(), permanent: true);
    Get.put<StorageHelper>(StorageHelperImpl(), permanent: true);
    Hive.registerAdapter(BlockChainAdapter());
  }
}
