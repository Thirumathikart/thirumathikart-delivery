import 'package:geocoding/geocoding.dart';
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
      position: pos1,
      consumeTapEvents: true,
      onTap: () {
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: pos1, zoom: 12.5)));
      },
    ));
  }

  Future<void> fetchLatitudeAndLongitude(
      String address1, String address2) async {
    try {
      List<Location> locations = await locationFromAddress(address1);
      List<Location> location = await locationFromAddress(address2);

      if ((locations != null && location != null) &&
          (locations.isNotEmpty && location.isNotEmpty)) {
        Location firstLocation = locations.first;
        Location secondLocation = location.first;
        LatLng latLng = LatLng(firstLocation.latitude, firstLocation.longitude);
        LatLng latLng1 =
            LatLng(secondLocation.latitude, secondLocation.longitude);
        // Now you can call addMarker with the obtained latitude and longitude
        addMarker(latLng, latLng1);
      } else {
        print('No location found for the address: $address1,$address2');
      }
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    String address1 = 'nit trichy,tamil Nadu,India';
    String address2 = 'central bus stand,trichy, Tamil Nadu, India';
    fetchLatitudeAndLongitude(address1, address2);
    // fetchLatitudeAndLongitude(address2);
  }
}