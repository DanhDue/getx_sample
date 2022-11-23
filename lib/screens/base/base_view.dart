import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseView<C extends BaseController> extends GetView<C> {
  const BaseView({Key? key}) : super(key: key);

  void showLoadingDialog() {
    Fimber.d('showLoadingDialog()');
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
  }
}
