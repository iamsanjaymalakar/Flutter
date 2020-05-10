import 'package:geolocator/geolocator.dart';

class Location {
  double lat, lon;

  Future<void> getLocation() async {
    try {
      var loc = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = loc.latitude;
      lon = loc.longitude;
    } catch (e) {
      print(e);
    }
  }
}
