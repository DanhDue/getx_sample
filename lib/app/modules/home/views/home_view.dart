// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';
import 'package:getx_sample/app/modules/home/bindings/home_binding.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/styles/theme_extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends BaseBindingCreatorView<HomeBinding, HomeController> {
  HomeView({Key? key, required BindingCreator<HomeBinding>? bindingCreator})
      : super(key: key, bindingCreator: bindingCreator);

  @override
  Widget? onCreateViews(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: controller.myLocation,
                onMapCreated: (GoogleMapController gMapController) {
                  controller.gMapController.complete(gMapController);
                },
                zoomControlsEnabled: false,
                trafficEnabled: controller.trafficEnabled.value,
                markers: Set<Marker>.of(controller.markers.values),
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: context.themeExtensions.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: context.themeExtensions.water,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'T',
                      style: context.themeExtensions.heading1
                          .copyWith(color: context.themeExtensions.red),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: context.themeExtensions.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: context.themeExtensions.water,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'Poi',
                      style: context.themeExtensions.heading2
                          .copyWith(color: context.themeExtensions.red),
                    ),
                  ),
                ),
              ],
            ),
          ).marginOnly(top: 69, left: 20),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => controller.goToVehicle(),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: context.themeExtensions.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: context.themeExtensions.water,
                    ),
                    child: Center(
                      child: Assets.images.icCar.image(width: 36, height: 36, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => controller.toMyLocation(),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: context.themeExtensions.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: context.themeExtensions.water,
                    ),
                    child: Center(
                      child: Center(
                        child:
                            Assets.images.icTarget.image(width: 36, height: 36, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: context.themeExtensions.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: context.themeExtensions.water,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      '+',
                      style: context.themeExtensions.paragraph
                          .copyWith(color: context.themeExtensions.red, fontSize: 36),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: context.themeExtensions.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: context.themeExtensions.water,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      '-',
                      style: context.themeExtensions.paragraph
                          .copyWith(color: context.themeExtensions.red, fontSize: 36),
                    ),
                  ),
                ),
              ],
            ),
          ).marginOnly(bottom: 96, left: 20),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => controller.trafficEnabled.value = !controller.trafficEnabled.value,
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: context.themeExtensions.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: context.themeExtensions.black.withOpacity(0.3),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        'Traf',
                        style: context.themeExtensions.heading3
                            .copyWith(color: context.themeExtensions.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: context.themeExtensions.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: context.themeExtensions.black.withOpacity(0.3),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'View',
                      style: context.themeExtensions.heading3
                          .copyWith(color: context.themeExtensions.white),
                    ),
                  ),
                ),
              ],
            ),
          ).marginOnly(top: 69, right: 20),
        ],
      ),
    );
  }
}
