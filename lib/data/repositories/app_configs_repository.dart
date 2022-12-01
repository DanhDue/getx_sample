import 'package:getx_sample/data/bean/app_configurations.dart';

abstract class AppConfigsRepository {
  Future saveAppConfigurations(AppConfigurations? appConfigurations);

  Future<AppConfigurations?> retrieveAppConfigurations();
}
