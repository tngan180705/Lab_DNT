import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState(); // Chữ Loading phải giống nhau
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // 1. Lấy dữ liệu thời tiết từ WeatherModel
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    // 2. Kiểm tra xem có dữ liệu không trước khi chuyển trang
    if (weatherData != null) {
      // 3. Chuyển sang LocationScreen và xóa luôn màn hình Loading khỏi bộ nhớ
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(locationWeather: weatherData);
          },
        ),
      );
    } else {
      // Nếu weatherData bị null, in lỗi để kiểm tra
      print("Không lấy được dữ liệu từ API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
      ),
    );
  }
}
