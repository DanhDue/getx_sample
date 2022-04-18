import 'package:get/get.dart';

import 'program_controller.dart';

class ProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgramController());
  }
}
