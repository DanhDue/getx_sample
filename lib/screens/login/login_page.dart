import 'package:flutter/material.dart';
import 'package:getx_sample/screens/base/base_view.dart';

import 'login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Login Screen.'),
    );
  }
}
