import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  List<Marker> allMarkers = <Marker>[].obs;
  late GoogleMapController googleMapController;
  void addMarker(LatLng pos, LatLng pos1) async {
    allMarkers.add(Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: pos,
      consumeTapEvents: true,
      onTap: () {
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: pos, zoom: 12.5)));
      },
    ));
    allMarkers.add(Marker(
      markerId: const MarkerId('destination'),
      infoWindow: const InfoWindow(title: 'Destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: pos,
      consumeTapEvents: true,
      onTap: () {
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: pos1, zoom: 12.5)));
      },
    ));
  }

  @override
  void onReady() {
    addMarker(
        const LatLng(10.790433, 78.704562), const LatLng(10.768061, 78.813578));
  }
}
