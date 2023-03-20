// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:get/get.dart';

import '../controllers/tea_home_controller.dart';

class TeaHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeaHomeController>(
      () => TeaHomeController(),
    );
  }
}
