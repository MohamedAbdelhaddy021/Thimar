import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GetAddressView extends StatefulWidget {
  const GetAddressView({super.key});

  @override
  State<GetAddressView> createState() => _GetAddressViewState();
}

class _GetAddressViewState extends State<GetAddressView> {
  Set<Marker> markers = {
    // const Marker(
    //     position: LatLng(31.1324526, 31.365748), markerId: MarkerId("1"))
  };
  final _controller = Completer<GoogleMapController>();
  String? myAddress;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          goToLocation(
            location: const LatLng(31.0181913, 31.388456),
          );
        },
        label: const Text('fly'),
        icon: const Icon(Icons.my_location_sharp),
      ),
      appBar: AppBar(
        title: const Text(
          "إضافة عنوان",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: Container(
          width: 200,
          height: 32,
          padding: EdgeInsetsDirectional.only(
            start: 8,
          ),
          margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Theme.of(context).primaryColor.withOpacity(0.13),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 8, bottom: 16.0),
              child: OutlinedButton(
                onPressed: () {
                  _determinePosition();
                  setState(() {});
                },
                child: Text("Live Location "),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.75,
              child: GoogleMap(
                markers: markers,
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                zoomGesturesEnabled: true,
                onTap: (argument) {
                  markers.add(Marker(
                      position: LatLng(argument.latitude, argument.longitude),
                      markerId: const MarkerId("1")));
                  setState(() {});
                },
                initialCameraPosition: const CameraPosition(
                  zoom: 14,
                  target: LatLng(31.1324526, 31.365748),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            if (myAddress != null) Text(myAddress!),
          ],
        ),
      ),
    );
  }

  Future<void> goToLocation({required LatLng location}) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 16, target: location),
      ),
    );
    markers.add(
      Marker(
        position: location,
        markerId: const MarkerId("1"),
      ),
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);
    var element = placemarks.first;
    print(element.name);
    myAddress = "${element.country} /${element.street}";
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // showMessage("Location services are disabled.");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var myposition = await Geolocator.getCurrentPosition();
    print("*" * 15);
    print(myposition.latitude);
    print(myposition.longitude);
    print("*" * 15);
    goToLocation(location: LatLng(myposition.latitude, myposition.longitude));
    return myposition;
  }
}
