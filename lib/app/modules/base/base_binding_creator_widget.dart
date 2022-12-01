// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';

import 'base_controller.dart';
import 'base_view.dart';

abstract class BaseBindingCreatorView<Binding extends Bindings, T extends BaseController>
    extends BaseView<T> {
  final BindingCreator<Binding>? bindingCreator;

  BaseBindingCreatorView({Key? key, required this.bindingCreator}) : super(key: key);

  Widget? onCreateViews(BuildContext context);

  @nonVirtual
  Widget build(BuildContext context) {
    _createBinding();
    return GestureDetector(
        onTap: () {
          // call this method here to hide soft keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: onCreateViews(context) ?? const SizedBox.shrink());
  }

  void _createBinding() {
    Binding? binding = bindingCreator?.call();
    binding?.dependencies();
  }
}
