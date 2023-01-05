// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';
import 'package:getx_sample/app/modules/checkin/bindings/checkin_binding.dart';

import '../controllers/checkin_controller.dart';

class CheckinView extends BaseBindingCreatorView<CheckinBinding, CheckinController> {
  CheckinView({Key? key, required BindingCreator<CheckinBinding>? bindingCreator})
      : super(key: key, bindingCreator: bindingCreator);

  @override
  Widget? onCreateViews(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckinView'),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () => controller.navigateToTheInfiniteListSample(),
        child: const Center(
          child: Text(
            'Navigate to the Infinite List sample.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
