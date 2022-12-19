// import 'dart:async';
import 'package:latlng/latlng.dart';
import 'package:latlong2/latlong.dart' as latLng;
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong/Circle.dart';
// import 'package:latlong2/latlong/Distance.dart';
// import 'package:latlong2/latlong/LatLng.dart';
// import 'package:latlong2/latlong/LengthUnit.dart';
// import 'package:latlong2/latlong/Path.dart';
// import 'package:latlong2/latlong/calculator/Haversine.dart';
// import 'package:latlong2/latlong/calculator/Vincenty.dart';
// import 'package:latlong2/latlong/interfaces.dart';
// import 'package:latlong2/spline.dart';
// import 'package:latlong2/spline/CatmullRomSpline.dart';
// // import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import "package:latlong/latlong.dart" as LatLng;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(6.927079, 79.861244),
          zoom: 9.2,
        ),
        // nonRotatedChildren: [
        //   // AttributionWidget.defaultWidget(
        //   //   source: '',
        //   //   onSourceTapped: null,
        //   // ),
        // ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(6.927079, 79.861244),
                width: 80,
                height: 80,
                builder: (context) => const Icon(
                  Icons.pin_drop,
                  color: Color.fromARGB(255, 195, 33, 21),
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    //Scaffold(
    //   appBar: AppBar(title: Text("amp")),
    //   body: Center(
    //     child: Container(
    //       child: Column(children: [
    //         Flexible(
    //           child: FlutterMap(options: MapOptions(
    //             center: latLng.LatLng(6.927079, 79.861244),
    //             zoom: 8
    //           ),
    //           layers: [

    //           ]
    //           )
    //           )
    //       ]),
    //     ),
    //   ),
    // );
  }
}
