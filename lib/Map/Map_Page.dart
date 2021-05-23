import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geolocator/geolocator.dart';
import 'package:closer/Map/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  final Position initialPosition;

  Maps(this.initialPosition);
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position);
    });
    super.initState();
  }

  Widget arrowKeys(iconData) {
    return IconButton(
      color: Colors.white,
      icon: Icon(iconData),
      iconSize: 40,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF030047),
        appBar: AppBar(
            backgroundColor: Color(0XFF030047),
            title: Center(
              child: Text('Map'),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.initialPosition.latitude,
                        widget.initialPosition.longitude),
                    zoom: 18),
                mapType: MapType.satellite,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 18),
      ),
    );
  }
}
