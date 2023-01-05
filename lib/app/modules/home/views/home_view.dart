// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';
import 'package:getx_sample/app/modules/home/bindings/home_binding.dart';

import '../controllers/home_controller.dart';

class HomeView extends BaseBindingCreatorView<HomeBinding, HomeController> {
  HomeView({Key? key, required BindingCreator<HomeBinding>? bindingCreator})
      : super(key: key, bindingCreator: bindingCreator);

  @override
  Widget? onCreateViews(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
