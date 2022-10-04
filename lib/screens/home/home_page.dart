import 'package:auto_size_text/auto_size_text.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_sample/screens/base/base_view.dart';
import 'package:getx_sample/screens/home/home_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends BaseView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                VisibilityDetector(
                  key: const Key(''),
                  onVisibilityChanged: _handleVisibilityChanged,
                  child: SvgPicture.asset(
                    'assets/images/coin_logo.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                const AutoSizeText(
                  'Solar Coin (SXP)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Obx(() {
              return AutoSizeText(
                '\$${controller.coinInUSD.value}',
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              );
            }),
            const SizedBox(
              height: 7,
            ),
            Obx(() {
              return AutoSizeText(
                '${controller.coinInBTC.value} BTC',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    Fimber.d('_handleVisibilityChanged(VisibilityInfo ${info.toString()})');
    if (info.visibleBounds.isEmpty == false) {
      controller.fetchBinanceCoinPriceByUSD();
      controller.fetchBinanceCoinPriceByBTC();
    }
  }
}
