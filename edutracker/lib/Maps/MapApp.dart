import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';

class MapApp extends StatelessWidget {
  LatLng point = LatLng(49.5, -0.09);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(49.6, -0.09),
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
                      ))
            ])
          ],
        ),
      ],
    );
  }
}
