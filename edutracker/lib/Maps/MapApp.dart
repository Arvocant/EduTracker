import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class MapApp extends StatelessWidget {
  LatLng point = null;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
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
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Future<void> GetAddressFromLatLong(Position position) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(placemarks);
  //   Placemark place = placemarks[0];
  //   Address =
  //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () async {
            LatLng position = (await _getGeoLocationPosition()) as LatLng;
            point = position;
          },
          child: const Text(
            "Get current location",
            style: TextStyle(color: Colors.white),
          ),
        ),
        FlutterMap(
          options: MapOptions(
            // onTap: (p) {
            //   point = p;
            //   // setState(() {
            //   //   point = p;
            //   // });
            // },
            center: point,
            zoom: 10.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(markers: [
              Marker(
                  width: 100.0,
                  height: 100.0,
                  point: point,
                  builder: (ctx) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ))
            ])
          ],
        ),
      ],
    );
  }
}
