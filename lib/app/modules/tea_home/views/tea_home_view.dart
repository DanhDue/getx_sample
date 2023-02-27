import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/styles/theme_extensions.dart';
import 'package:getx_sample/utils/scale_size.dart';

import '../controllers/tea_home_controller.dart';

class TeaHomeView extends GetResponsiveView<TeaHomeController> {
  TeaHomeView({Key? key}) : super(key: key);
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Assets.web.assets.images.homeTopAds.image(fit: BoxFit.contain),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  'TEAMART',
                  style: screen.context.themeExtensions.heading1,
                  textScaleFactor: ScaleSize.textScaleFactor(screen.context),
                ),
              ],
            ),
            Stack(
              children: [
                Assets.web.assets.images.homeBanner.image(fit: BoxFit.contain),
                Container(width: 1410, height: 601)
              ],
            )
          ],
        ),
      ),
    );
  }
}
