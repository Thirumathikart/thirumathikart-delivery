import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/map_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';

class MapPage extends GetView<MapController> {
  MapPage({super.key});
  static const theinitialCameraPosition = CameraPosition(
    target: LatLng(10.790433, 78.704562),
    zoom: 12.5,
  );
  final Set<Polyline> polyline = {};
  // late List<LatLng>? routeCoords;
  final GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: 'AIzaSyB4i_iNoZguZkAUIB6rBjlRU85g2KkSdj4');

// getsomePoints() async {
//     var permissions =
//         await Permission.getPermissionsStatus([PermissionName.Location]);
//     if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
//       var askpermissions =
//           await Permission.requestPermissions([PermissionName.Location]);
//     } else {
//       routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
//           origin: LatLng(40.6782, -73.9442),
//           destination: LatLng(40.6944, -73.9212),
//           mode: RouteMode.driving);
//     }
//   }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Map'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * (0.5),
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Obx(() => GoogleMap(
                        onMapCreated:
                            (GoogleMapController mapController) async {
                          controller.googleMapController = mapController;

                          //   routeCoords = await googleMapPolyline
                          //       .getCoordinatesWithLocation(
                          //           origin: const LatLng(10.790433, 78.704562),
                          //           destination:
                          //               const LatLng(10.768061, 78.813578),
                          //           mode: RouteMode.driving);
                          //   polyline.add(Polyline(
                          //       polylineId: const PolylineId('route1'),
                          //       visible: true,
                          //       points: routeCoords!,
                          //       width: 4,
                          //       color: Colors.blue,
                          //       startCap: Cap.roundCap,
                          //       endCap: Cap.buttCap));
                        },
                        // polylines: polyline,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        initialCameraPosition: theinitialCameraPosition,
                        markers: Set<Marker>.of(controller.allMarkers),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.black,
                        onPressed: () =>
                            controller.googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                              theinitialCameraPosition),
                        ),
                        child: const Icon(Icons.center_focus_strong),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      top: 5.0, bottom: 5, left: 8, right: 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Buyer: Buyer Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Delivery Address : Buyer Address',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Buyer Contact : 1234567890',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Product Name - Poduct ',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Seller: Seller Name',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Return Address: Seller Address',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
