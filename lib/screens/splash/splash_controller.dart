import 'package:get/get.dart';
import 'package:getx_sample/app/routes/links.dart';
import 'package:getx_sample/screens/base/base_controller.dart';

class SplashController extends BaseController {
  bool _animationComplete = false;

  void indicateAnimationComplete() {
    _animationComplete = true;
    printInfo(info: "Navigate to the dashboard screen.");
    Get.offAllNamed(AppLinks.dashboard);
  }
}
