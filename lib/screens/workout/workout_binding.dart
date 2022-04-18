import 'package:get/get.dart';

import 'workout_controller.dart';

class WorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkoutController());
  }
}
