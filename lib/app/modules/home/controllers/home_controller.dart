// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'dart:async';
import 'dart:ui';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/routes/app_pages.dart';
import 'package:getx_sample/generated/colors.gen.dart';
import 'package:getx_sample/styles/theme_extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../generated/assets.gen.dart';

class HomeController extends BaseController {
  late Completer<GoogleMapController> gMapController;
  late CameraPosition myLocation;
  late CameraPosition vehicleLocation;
  late CameraPosition curLocation;
  final trafficEnabled = false.obs;
  static const vehicleMarkerId = MarkerId('vehicleMarkerId');
  static const currentLocationMarkerId = MarkerId('currentLocationMarkerId');
  static const destLocationMarkerId = MarkerId('myLocationMarkerId');
  static const backgroundPolylineId = PolylineId("backgroundPolylineId");
  static const animatedPolylineId = PolylineId("animatedPolylineId");

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  List<LatLng> backgroundPolylineCoordinates = [
    const LatLng(21.01116, 105.84728),
    const LatLng(21.01116, 105.84728),
    const LatLng(21.01125, 105.84795),
    const LatLng(21.01125, 105.84795),
    const LatLng(21.01169, 105.84802),
    const LatLng(21.01169, 105.84802),
    const LatLng(21.01088, 105.84885),
    const LatLng(21.01088, 105.84885),
    const LatLng(21.01064, 105.84911),
    const LatLng(21.01064, 105.84911),
    const LatLng(21.00979, 105.84995),
    const LatLng(21.00979, 105.84995),
    const LatLng(21.00929, 105.85049),
    const LatLng(21.00929, 105.85049),
    const LatLng(21.00907, 105.8507),
    const LatLng(21.00907, 105.8507),
    const LatLng(21.00862, 105.85106),
    const LatLng(21.00862, 105.85106),
    const LatLng(21.00861, 105.8514),
    const LatLng(21.00861, 105.8514),
    const LatLng(21.00855, 105.85235),
    const LatLng(21.00855, 105.85235),
    const LatLng(21.00856, 105.85292),
    const LatLng(21.00856, 105.85292),
    const LatLng(21.00858, 105.85311),
    const LatLng(21.00858, 105.85311),
    const LatLng(21.00896, 105.85508),
    const LatLng(21.00896, 105.85508),
    const LatLng(21.00908, 105.85582),
    const LatLng(21.00908, 105.85582),
    const LatLng(21.0091, 105.85624),
    const LatLng(21.0091, 105.85624),
    const LatLng(21.00905, 105.85859),
    const LatLng(21.00905, 105.85859),
    const LatLng(21.00904, 105.85929),
    const LatLng(21.00904, 105.85929),
    const LatLng(21.00899, 105.86043),
    const LatLng(21.00899, 105.86043),
    const LatLng(21.00888, 105.86057),
    const LatLng(21.00888, 105.86057),
    const LatLng(21.00869, 105.86071),
    const LatLng(21.00869, 105.86071)
  ];

  List<LatLng> animatedPolylineCoordinates = [];
  late Timer _timer;

  late int _index;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void onInit() async {
    super.onInit();
    myLocation = const CameraPosition(
      target: LatLng(21.0316059, 105.7922232),
      zoom: 20,
    );
    vehicleLocation = const CameraPosition(
      target: LatLng(21.01116, 105.84728),
      zoom: 20,
    );
    curLocation = const CameraPosition(
      target: LatLng(21.01116, 105.84728),
      zoom: 20,
    );
    gMapController = Completer<GoogleMapController>();
    markers[vehicleMarkerId] = Marker(
      markerId: vehicleMarkerId,
      position: vehicleLocation.target,
      infoWindow: const InfoWindow(
          title: 'Pagani Huaya',
          snippet: 'Pagani Huaya Roadster: 2023	\n-829 horsepower			>\n-Mercedes-AMG V12			'),
    );
    markers[destLocationMarkerId] = Marker(
      markerId: destLocationMarkerId,
      position: myLocation.target,
      infoWindow: const InfoWindow(title: 'Vị trí của bạn'),
    );

    markers[currentLocationMarkerId] = Marker(
      markerId: currentLocationMarkerId,
      position: vehicleLocation.target,
      infoWindow: const InfoWindow(title: 'Vị trí hiện tại'),
    );

    polylines[backgroundPolylineId] = Polyline(
      polylineId: backgroundPolylineId,
      points: backgroundPolylineCoordinates,
      color: Get.context?.themeExtensions.lightSilver ?? LMSColors.lightSilver,
      width: 6,
    );

    polylines[animatedPolylineId] = Polyline(
      polylineId: animatedPolylineId,
      points: animatedPolylineCoordinates,
      color: Get.context?.themeExtensions.red ?? LMSColors.red,
      width: 6,
    );

    _getAssetIcon(Assets.images.icCar.path).then(
      (BitmapDescriptor icon) {
        _setMarkerIcon(vehicleMarkerId, icon);
        Marker? curLocationMarker = markers[currentLocationMarkerId];
        markers[currentLocationMarkerId] = curLocationMarker?.copyWith(iconParam: icon) ??
            const Marker(markerId: currentLocationMarkerId);
      },
    );
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(18, 18)), Assets.images.icCar.path)
        .then((icon) {
      Marker? vehicleMarker = markers[vehicleMarkerId];
      markers[vehicleMarkerId] =
          vehicleMarker?.copyWith(iconParam: icon) ?? const Marker(markerId: vehicleMarkerId);
      Marker? curLocationMarker = markers[currentLocationMarkerId];
      markers[currentLocationMarkerId] = curLocationMarker?.copyWith(iconParam: icon) ??
          const Marker(markerId: currentLocationMarkerId);
      Marker? desLocationMarker = markers[destLocationMarkerId];
      markers[destLocationMarkerId] = desLocationMarker?.copyWith(iconParam: icon) ??
          const Marker(markerId: destLocationMarkerId);
      update();
    });
  }

  void animatePolyline() {
    Fimber.d("animatePolyline()");
    _index = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 1250), (timer) async {
      Fimber.d("Timer.periodic(const Duration(milliseconds: 200), (timer)");
      if (_index < backgroundPolylineCoordinates.length - 1) {
        _index++;
        curLocation = CameraPosition(target: backgroundPolylineCoordinates[_index], zoom: 20);
        animatedPolylineCoordinates.add(backgroundPolylineCoordinates[_index]);
        final GoogleMapController controller = await gMapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: backgroundPolylineCoordinates[_index], zoom: 20),
          ),
        );

        Marker? curLocationMarker = markers[currentLocationMarkerId];
        markers[currentLocationMarkerId] =
            curLocationMarker?.copyWith(positionParam: backgroundPolylineCoordinates[_index]) ??
                const Marker(markerId: currentLocationMarkerId);

        update();
      } else {
        _timer.cancel();
        update();
      }
    });
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
      zoom: 20,
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

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
