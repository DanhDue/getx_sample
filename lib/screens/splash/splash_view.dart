import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'splash_logic.dart';

class SplashPage extends HookWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animationController = useAnimationController();
    return GetBuilder<SplashLogic>(
      init: SplashLogic(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Lottie.asset(
              'assets/lotties/splash_animation.json',
              controller: _animationController,
              onLoaded: (composition) {
                _animationController
                  ..duration = composition.duration
                  ..forward();
                _animationController.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    controller.indicateAnimationComplete();
                  }
                });
              },
              height: Get.height / 4
            ),
          ),
        );
      },
    );
  }
}