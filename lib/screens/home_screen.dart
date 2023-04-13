import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shtushnyi/widgets/shtushnyi_add_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Marker> _markers = [];

  void addMarker(LatLng location) {
    setState(() {
      _markers.add(Marker(
          point: LatLng(location.latitude, location.longitude),
          width: 25,
          height: 25,
          builder: (context) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      context: context,
                      builder: (ctx) => Column(
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

  void onMapTap(LatLng location) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        builder: (ctx) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: Container(
                      height: 6,
                      width: 50,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  height: 8,
                ),
                ShtushnyiAddForm(
                  action: (
                      {required title, required comment, required rating}) {
                    print('$title, $comment, $rating');
                    addMarker(location);
                    Navigator.pop(context);
                  },
                ),
              ]),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Штушный is lifestyle',
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
