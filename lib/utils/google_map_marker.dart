import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';*/

class GoogleMapMarker extends StatefulWidget {
  @override
  _GoogleMapMarkerState createState() => _GoogleMapMarkerState();
}

class _GoogleMapMarkerState extends State<GoogleMapMarker> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(40.90000, 29.21821);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  void initState() {
    _onAddMarkerButtonPressed();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 2,
      height: height / 2,
      /*margin: EdgeInsets.symmetric(
        horizontal: width / 50,
        vertical: height / 50,
      ),*/
      child: GoogleMap(
        markers: _markers,
        onCameraMove: _onCameraMove,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
