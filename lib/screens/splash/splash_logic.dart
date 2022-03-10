import 'package:get/get.dart';

import '../../main.dart';

class SplashLogic extends GetxController {
  bool _animationComplete = false;

  void indicateAnimationComplete() {
    _animationComplete = true;
    Get.to(const Home());
  }

}
