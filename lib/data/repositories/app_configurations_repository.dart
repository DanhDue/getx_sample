import 'package:getx_sample/data/bean/app_configurations/app_configurations.dart';

abstract class AppConfigurationsRepository {
  Future<AppConfigurations?> retriveAppConfigurations();
}
