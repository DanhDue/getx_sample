import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkin_controller.dart';

class CheckinView extends GetView<CheckinController> {
  const CheckinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckinView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CheckinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
