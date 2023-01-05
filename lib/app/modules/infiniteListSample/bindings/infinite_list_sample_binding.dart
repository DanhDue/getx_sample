// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:get/get.dart';

import '../controllers/infinite_list_sample_controller.dart';

class InfiniteListSampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfiniteListSampleController>(
      () => InfiniteListSampleController(),
    );
  }
}
