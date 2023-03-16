import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineAnimationPage extends StatefulWidget {
  @override
  _PolylineAnimationPageState createState() => _PolylineAnimationPageState();
}

class _PolylineAnimationPageState extends State<PolylineAnimationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  List<LatLng> _polylineCoordinates = [
    const LatLng(40.7128, -74.0060),
    const LatLng(41.8781, -87.6298),
    const LatLng(37.7749, -122.4194),
    const LatLng(34.0522, -118.2437),
  ];
  Set<Polyline> _polylines = {};
  Polyline _polyline = const Polyline(
    polylineId: PolylineId("route"),
    color: Colors.blue,
    width: 5,
    // points: _polylineCoordinates,
  );
  late Timer _timer;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
    // _polyline.points = [_polylineCoordinates[_index]];
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        if (_index < _polylineCoordinates.length - 1) {
          _index++;
          _polyline.points.add(_polylineCoordinates[_index]);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _polylines.add(_polyline);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Polyline Animation"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _polylineCoordinates.first,
          zoom: 5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        polylines: _polylines,
      ),
    );
  }
}
