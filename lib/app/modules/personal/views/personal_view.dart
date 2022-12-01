import 'package:flutter/material.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';
import 'package:getx_sample/app/modules/personal/bindings/personal_binding.dart';

import '../controllers/personal_controller.dart';

class PersonalView extends BaseBindingCreatorView<PersonalBinding, PersonalController> {
  PersonalView({Key? key, required BindingCreator<PersonalBinding> bindingCreator})
      : super(key: key, bindingCreator: bindingCreator);

  @override
  Widget? onCreateViews(BuildContext context) {
    Scaffold(
      appBar: AppBar(
        title: const Text('PersonalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PersonalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
