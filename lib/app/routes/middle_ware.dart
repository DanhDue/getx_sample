import 'package:fimber/fimber.dart';
import 'package:get/get.dart';

import 'links.dart';

class MiddleWare {
  static observer(Routing? routing) {
    if (routing?.current == AppLinks.tokenIsExpired) {
      Fimber.d('MiddleWare.observer() - AppLinks.tokenIsExpired');
      Get.offNamed(AppLinks.login);
    } else {
      Fimber.d('MiddleWare.observer() - unknown the route.');
    }
  }
}
