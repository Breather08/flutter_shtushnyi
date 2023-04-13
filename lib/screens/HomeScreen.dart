import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Marker> _markers = [];

  void onMapTap(LatLng location) {
    setState(() {
      _markers.add(Marker(
          point: LatLng(location.latitude, location.longitude),
          width: 25,
          height: 25,
          builder: (context) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (ctx) => ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16)),
                            child: Container(
                              color: Colors.white,
                              height: 200,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      child: Container(
                                        height: 6,
                                        width: 50,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            ),
                          ));
                },
                child: const CircleAvatar(
                  child: Icon(
                    Icons.smoking_rooms,
                    size: 15,
                  ),
                ),
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Штушный шегіп ал',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FlutterMap(
        options: MapOptions(
            onTap: (_, location) => onMapTap(location),
            center: LatLng(51.088398, 71.412203),
            zoom: 15),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/brthr08/clgf2fe2v000x01mj00o951mj/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYnJ0aHIwOCIsImEiOiJjbGdlenFkdTUwMGFxM2RubWw0MDhoOWg0In0.0mMPlJb1q1GdrYDuitcQ5Q',
            additionalOptions: const {
              'accessToken':
                  'sk.eyJ1IjoiYnJ0aHIwOCIsImEiOiJjbGdmMDFqancwMW12M25zMnpzbHY0OHo5In0.qAE_6M79mqKhQlN4UAbEZw',
              'id':
                  'mapbox.mapbox-streets-v8', // can use other Mapbox styles here
            },
          ),
          MarkerLayer(
            markers: _markers,
          )
        ],
      ),
    );
  }
}
