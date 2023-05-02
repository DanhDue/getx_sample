import 'package:get/get.dart';

import '../controllers/resolution_controller.dart';

class ResolutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResolutionController>(
      () => ResolutionController(),
    );
  }
}
