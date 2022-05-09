import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_sample/data/bean/app_configurations/app_configurations.dart';
import 'package:getx_sample/data/bean/block_chain/block_chain.dart';
import 'package:getx_sample/data/local/storage_helper.dart';
import 'package:getx_sample/data/local/storage_helper_impl.dart';
import 'package:getx_sample/data/repositories/app_configurations_repository.dart';
import 'package:getx_sample/data/repositories/impl/app_configurations_repository_impl.dart';
import 'package:hive/hive.dart';

class AppGlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());

    Hive.registerAdapter(BlockChainAdapter());
    Hive.registerAdapter(AppConfigurationsAdapter());
    Get.put<StorageHelper>(StorageHelperImpl(), permanent: true);
    Get.put<AppConfigurationsRepository>(AppConfigurationsRepositoryImpl(),
        permanent: true);
  }
}
