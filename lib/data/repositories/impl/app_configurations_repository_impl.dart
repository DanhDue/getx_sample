import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/bean/app_configurations/app_configurations.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:getx_sample/data/repositories/app_configurations_repository.dart';
import 'package:hive/hive.dart';

class AppConfigurationsRepositoryImpl extends AppConfigurationsRepository {
  @override
  Future<AppConfigurations?> retrieveAppConfigurations() async {
    var box = await Hive.openBox<AppConfigurations>(StorageKeys.appConfigBoxName);
    Fimber.d(box.get(StorageKeys.appConfigBoxName).toString());
    return box.get(StorageKeys.appConfigBoxName);
  }

  @override
  Future saveAppConfigurations(AppConfigurations? appConfigurations) async {
    if (appConfigurations == null) return;
    var box = await Hive.openBox<AppConfigurations>(StorageKeys.appConfigBoxName);
    box.put(StorageKeys.appConfigBoxName, appConfigurations);
    Fimber.d(box.values.toString());
  }
}
