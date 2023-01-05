// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:getx_sample/data/bean/app_configurations.dart';

abstract class AppConfigsRepository {
  Future saveAppConfigurations(AppConfigurations? appConfigurations);

  Future<AppConfigurations?> retrieveAppConfigurations();
}
