import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> getCurrantLocation() async {
    bool isServiceEnable = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnable) {
      await Geolocator.requestPermission();
    }
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
