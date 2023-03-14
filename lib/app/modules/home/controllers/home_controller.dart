// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'dart:async';
import 'dart:ui';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/routes/app_pages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../generated/assets.gen.dart';

class HomeController extends BaseController {
  late Completer<GoogleMapController> gMapController;
  late CameraPosition myLocation;
  late CameraPosition vehicleLocation;
  final trafficEnabled = false.obs;
  static const vehicleMarkerId = MarkerId('vehicleMarkerId');
  static const myLocationMarkerId = MarkerId('myLocationMarkerId');

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void onInit() async {
    super.onInit();
    myLocation = const CameraPosition(
      target: LatLng(21.0316059, 105.7922232),
      zoom: 14,
    );
    vehicleLocation = const CameraPosition(
      target: LatLng(21.0282605, 105.7886473),
      zoom: 16,
    );
    gMapController = Completer<GoogleMapController>();
    markers[vehicleMarkerId] = Marker(
      markerId: vehicleMarkerId,
      position: vehicleLocation.target,
      infoWindow: const InfoWindow(
          title: 'Pagani Huaya',
          snippet: 'Pagani Huaya Roadster: 2023	\n-829 horsepower			>\n-Mercedes-AMG V12			'),
    );
    markers[myLocationMarkerId] = Marker(
      markerId: myLocationMarkerId,
      position: myLocation.target,
      infoWindow: const InfoWindow(title: 'Vị trí của bạn'),
    );

    _getAssetIcon(Assets.images.icCar.path).then(
      (BitmapDescriptor icon) {
        _setMarkerIcon(vehicleMarkerId, icon);
      },
    );
  }

  navigateToTheInfiniteListSample() {
    Fimber.d('navigateToTheInfiniteListSample()');
    Get.toNamed(Routes.INFINITE_LIST_SAMPLE);
  }

  Future<void> goToVehicle() async {
    Fimber.d("Future<void> goToTheLake() async");
    final GoogleMapController controller = await gMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(vehicleLocation));
  }

  Future<void> toMyLocation() async {
    Fimber.d("Future<void> goToTheLake() async");
    final GoogleMapController controller = await gMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myLocation));
    myLocation = const CameraPosition(
      target: LatLng(21.0316059, 105.7922232),
      zoom: 16,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(myLocation));
  }

  void _setMarkerIcon(MarkerId markerId, BitmapDescriptor assetIcon) {
    final Marker marker = markers[markerId]!;
    markers[markerId] = marker.copyWith(
      iconParam: assetIcon,
    );
    trafficEnabled.value = false;
  }

  Future<BitmapDescriptor> _getAssetIcon(String imageName) async {
    final Completer<BitmapDescriptor> bitmapIcon = Completer<BitmapDescriptor>();

    AssetImage(imageName)
        .resolve(const ImageConfiguration(size: Size(36, 36)))
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData? bytes = await image.image.toByteData(format: ImageByteFormat.png);
      if (bytes == null) {
        bitmapIcon.completeError(Exception('Unable to encode icon'));
        return;
      }
      final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return bitmapIcon.future;
  }
}
