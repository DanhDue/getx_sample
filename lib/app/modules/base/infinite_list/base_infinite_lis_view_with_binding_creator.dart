// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';
import 'package:getx_sample/app/modules/base/infinite_list/base_infinite_list_controller.dart';
import 'package:getx_sample/app/modules/base/infinite_list/base_infinite_list_view.dart';

abstract class BaseInfiniteListViewWithCreator<Binding extends Bindings,
    C extends BaseInfiniteListController> extends BaseInfiniteListView<C> {
  final BindingCreator<Binding>? bindingCreator;

  BaseInfiniteListViewWithCreator({Key? key, required this.bindingCreator})
      : super(key: key, bindingCreator: bindingCreator);

  @override
  Widget build(BuildContext context) {
    _createBinding();
    return super.build(context);
  }

  void _createBinding() {
    Binding? binding = bindingCreator?.call();
    binding?.dependencies();
  }
}
