// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/routes/app_pages.dart';
import 'package:getx_sample/data/bean/location_object/location_object.dart';
import 'package:getx_sample/generated/colors.gen.dart';
import 'package:getx_sample/styles/theme_extensions.dart';
import 'package:getx_sample/utils/extensions/extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../generated/assets.gen.dart';

class HomeController extends BaseController {
  late Completer<GoogleMapController> gMapController;
  CameraPosition? myLocation;
  CameraPosition? sourceLocation;
  CameraPosition? destLocation;
  CameraPosition? curLocation;
  final trafficEnabled = false.obs;
  static const vehicleMarkerId = MarkerId('vehicleMarkerId');
  static const currentLocationMarkerId = MarkerId('currentLocationMarkerId');
  static const destLocationMarkerId = MarkerId('myLocationMarkerId');
  static const backgroundPolylineId = PolylineId("backgroundPolylineId");
  static const animatedPolylineId = PolylineId("animatedPolylineId");

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  List<LatLng> backgroundPolylineCoordinates = [];
  List<LatLng> animatedPolylineCoordinates = [];
  late Timer _timer;
  late int _index;

  late List<LocationObject?>? locationList = [];

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void onInit() async {
    super.onInit();
    final sLocationList = await rootBundle.loadString(Assets.jsons.locations);
    Iterable iLocations = jsonDecode(sLocationList);
    locationList = List<LocationObject?>.from(iLocations.map((e) => LocationObject.fromJson(e)));
    Fimber.d(sLocationList);

    locationList?.first?.let(
      (self) => {
        sourceLocation =
            CameraPosition(target: LatLng(self.latitude ?? 0.0, self.longitude ?? 0.0), zoom: 16),
        curLocation =
            CameraPosition(target: LatLng(self.latitude ?? 0.0, self.longitude ?? 0.0), zoom: 16)
      },
    );

    locationList?.last?.let(
      (self) => {
        destLocation =
            CameraPosition(target: LatLng(self.latitude ?? 0.0, self.longitude ?? 0.0), zoom: 16)
      },
    );

    locationList?.forEach((element) {
      element?.toLatLng()?.let((self) => backgroundPolylineCoordinates.add(self));
    });

    myLocation = const CameraPosition(
      target: LatLng(21.0316059, 105.7922232),
      zoom: 16,
    );

    gMapController = Completer<GoogleMapController>();
    markers[vehicleMarkerId] = Marker(
      markerId: vehicleMarkerId,
      position: sourceLocation?.target ?? const LatLng(21.0316059, 105.7922232),
      infoWindow: const InfoWindow(
          title: 'Pagani Huaya',
          snippet: 'Pagani Huaya Roadster: 2023	\n-829 horsepower			>\n-Mercedes-AMG V12			'),
    );
    markers[destLocationMarkerId] = Marker(
      markerId: destLocationMarkerId,
      position: myLocation?.target ?? const LatLng(21.0316059, 105.7922232),
      infoWindow: const InfoWindow(title: 'Vị trí của bạn'),
    );

    markers[currentLocationMarkerId] = Marker(
      markerId: currentLocationMarkerId,
      position: sourceLocation?.target ?? const LatLng(21.0316059, 105.7922232),
      rotation: locationList![0]?.heading ?? 0.0,
      infoWindow: const InfoWindow(title: 'Vị trí hiện tại'),
    );

    polylines[backgroundPolylineId] = Polyline(
      polylineId: backgroundPolylineId,
      points: backgroundPolylineCoordinates,
      color: Get.context?.themeExtensions.textGrey ?? LMSColors.textGrey,
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
    _getAssetIcon(Assets.images.icDirection.path).then(
      (value) {
        _setMarkerIcon(currentLocationMarkerId, value);
      },
    );
    update();
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(18, 18)), Assets.images.icCar.path)
        .then((icon) {
      Marker? vehicleMarker = markers[vehicleMarkerId];
      markers[vehicleMarkerId] =
          vehicleMarker?.copyWith(iconParam: icon) ?? const Marker(markerId: vehicleMarkerId);
      update();
    });
  }

  void animatePolyline() {
    Fimber.d("animatePolyline()");
    _index = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      Fimber.d("Timer.periodic(const Duration(milliseconds: 200), (timer)");
      if (_index < backgroundPolylineCoordinates.length - 1) {
        _index++;
        curLocation = CameraPosition(target: backgroundPolylineCoordinates[_index], zoom: 16);
        animatedPolylineCoordinates.add(backgroundPolylineCoordinates[_index]);
        final GoogleMapController controller = await gMapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: backgroundPolylineCoordinates[_index], zoom: 16),
          ),
        );

        Marker? curLocationMarker = markers[currentLocationMarkerId];
        markers[currentLocationMarkerId] = curLocationMarker?.copyWith(
                positionParam: backgroundPolylineCoordinates[_index],
                rotationParam: locationList![_index]?.heading,
                anchorParam: const Offset(0.5, 0.5)) ??
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
    controller.animateCamera(CameraUpdate.newCameraPosition(sourceLocation ??
        const CameraPosition(
          target: LatLng(21.0316059, 105.7922232),
          zoom: 16,
        )));
  }

  Future<void> toMyLocation() async {
    Fimber.d("Future<void> goToTheLake() async");
    final GoogleMapController controller = await gMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myLocation ??
        const CameraPosition(
          target: LatLng(21.0316059, 105.7922232),
          zoom: 16,
        )));
    myLocation = const CameraPosition(
      target: LatLng(21.0316059, 105.7922232),
      zoom: 20,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(myLocation ??
        const CameraPosition(
          target: LatLng(21.0316059, 105.7922232),
          zoom: 16,
        )));
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
        .resolve(const ImageConfiguration(size: Size(136, 136)))
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
