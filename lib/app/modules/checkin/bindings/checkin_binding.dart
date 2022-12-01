import 'package:get/get.dart';

import '../controllers/checkin_controller.dart';

class CheckinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckinController>(
      () => CheckinController(),
    );
  }
}
