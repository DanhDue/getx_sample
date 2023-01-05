// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:fimber/fimber.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/routes/app_pages.dart';

class HomeController extends BaseController {
  navigateToTheInfiniteListSample() {
    Fimber.d('navigateToTheInfiniteListSample()');
    Get.toNamed(Routes.INFINITE_LIST_SAMPLE);
  }
}
