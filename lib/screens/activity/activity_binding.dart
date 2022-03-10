import 'package:get/get.dart';

import 'activity_logic.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityLogic());
  }
}
