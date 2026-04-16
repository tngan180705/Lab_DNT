import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Yêu cầu quyền truy cập vị trí
      LocationPermission permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        forceAndroidLocationManager: true,
        timeLimit: Duration(seconds: 15),
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Lỗi lấy vị trí: $e');
    }
  }
}
