import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'b25bb9d97640b1ccc9a13391419cff5f';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // Lấy thời tiết theo tên thành phố (Dùng cho CityScreen)
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric',
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Lấy thời tiết theo vị trí GPS (Dùng cho LoadingScreen & nút Near Me)
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '❄️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  String getMessage(int temp) {
    if (temp > 25) return 'Thời điểm tuyệt vời để ăn 🍦';
    if (temp > 20) return 'Thời tiết đẹp để mặc 👕';
    if (temp < 10)
      return 'Bạn sẽ cần mang theo 🧥'; // Thử đổi emoji đơn giản hơn
    return 'Hãy mang theo một chiếc ☂️ đề phòng'; // Dùng cây dù ☂️ thay vì 🧥 nếu vẫn lỗi
  }
}
