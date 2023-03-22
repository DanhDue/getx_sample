// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_info_window/custom_info_window.dart';
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
          GetBuilder<HomeController>(
              builder: (controller) => (controller.sourceLocation == null)
                  ? const Center(child: AutoSizeText("Loading..."))
                  : Stack(
                      children: [
                        GoogleMap(
                          onTap: (argument) => controller.mapInfoWindowController.hideInfoWindow,
                          mapType: controller.satelliteMap.value == true
                              ? MapType.satellite
                              : MapType.normal,
                          initialCameraPosition: controller.sourceLocation ??
                              CameraPosition(
                                target: const LatLng(21.0316059, 105.7922232),
                                zoom: controller.mapZoom,
                              ),
                          onCameraMove: (position) =>
                              controller.mapInfoWindowController.onCameraMove,
                          onMapCreated: (GoogleMapController gMapController) {
                            controller.gMapController.complete(gMapController);
                            controller.mapInfoWindowController.googleMapController =
                                gMapController;
                          },
                          zoomControlsEnabled: false,
                          trafficEnabled: controller.trafficEnabled.value,
                          polylines: Set<Polyline>.of(controller.polylines.values),
                          markers: Set<Marker>.of(controller.markers.values),
                        ),
                        CustomInfoWindow(
                          controller: controller.mapInfoWindowController,
                          height: 136,
                          width: 222,
                          offset: 15,
                        ),
                      ],
                    )),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => controller.addInfoWindow(),
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
                      child: Assets.images.icFormatTextGrey60036dp
                          .image(width: 36, height: 36, fit: BoxFit.cover),
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
                InkWell(
                  onTap: () => controller.updateMapZoomValue(0.5),
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
                      child: AutoSizeText(
                        '+',
                        style: context.themeExtensions.paragraph
                            .copyWith(color: context.themeExtensions.red, fontSize: 36),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => controller.updateMapZoomValue(-0.5),
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
                      child: AutoSizeText(
                        '-',
                        style: context.themeExtensions.paragraph
                            .copyWith(color: context.themeExtensions.red, fontSize: 36),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).marginOnly(bottom: 126, left: 20),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => controller.changeTrafficStatus(),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: context.themeExtensions.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: context.themeExtensions.black.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Obx(() => controller.trafficEnabled.value == true
                          ? Assets.images.trafficOn.image(width: 46, height: 46, fit: BoxFit.cover)
                          : Assets.images.trafficOff
                              .image(width: 46, height: 46, fit: BoxFit.cover)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => controller.changeMapType(),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: context.themeExtensions.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: context.themeExtensions.black.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Obx(() => controller.satelliteMap.value == true
                          ? Assets.images.mapLayerSatellite
                              .image(width: 46, height: 46, fit: BoxFit.cover)
                          : Assets.images.mapLayerRoad
                              .image(width: 46, height: 46, fit: BoxFit.cover)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => controller.animatePolyline(),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: context.themeExtensions.lightSilver,
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: context.themeExtensions.white,
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          const Icon(
                            Icons.directions,
                            size: 33,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Obx(() => Visibility(
                                  visible: controller.animationSpeed.value != -1,
                                  child: AutoSizeText(
                                    "${controller.animationSpeed.value}x",
                                    style: context.themeExtensions.subTexMedium.copyWith(
                                        color: context.themeExtensions.red,
                                        fontWeight: FontWeight.w900),
                                  ),
                                )),
                          ),
                        ],
                      ).paddingAll(3),
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
