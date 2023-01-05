// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:get/get.dart';
import 'package:getx_sample/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.DASH_BOARD);
    });
  }
}
