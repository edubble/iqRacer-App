import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iq_racer/src/global_values/utils.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.latitude, required this.longitude, required this.city})
      : super(key: key);

  final String city;
  final double latitude;
  final double longitude;

  @override
  State<MapPage> createState() => _MyMyGoogleMapState();
}

class _MyMyGoogleMapState extends State<MapPage> {
  // Variables of Google maps
  late LatLng _kMapCenter;
  late CameraPosition _kInitialPosition;
  late GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/locations/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  void initState() {
    super.initState();
    _kMapCenter = LatLng(widget.latitude, widget.longitude);
    _kInitialPosition =
        CameraPosition(target: _kMapCenter, zoom: 13.0, tilt: 0, bearing: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        centerTitle: true,
        toolbarHeight: 60,
        flexibleSpace: appBarStyle(),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        padding: const EdgeInsets.only(top: 20),
      ),
    );
  }
}
