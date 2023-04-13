import 'package:latlong2/latlong.dart';

class Shtushnyi {
  final LatLng location;
  final String title;
  final List<String>? comments;

  Shtushnyi({required this.title, required this.location, this.comments});
}
