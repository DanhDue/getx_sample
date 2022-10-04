import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseView<C extends BaseController> extends GetView<C> {
  BaseView({Key? key}) : super(key: key);

  var loadingDialogIsShown = false;

  void showLoadingDialog() {
    Fimber.d('showLoadingDialog()');
    loadingDialogIsShown = true;
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  void hideLoadingDialog() {
    Fimber.d("hideLoadingDialog()");
    if (loadingDialogIsShown) {
      loadingDialogIsShown = false;
      Get.back();
    }
  }
}
