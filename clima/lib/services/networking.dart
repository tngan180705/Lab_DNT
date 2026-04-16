import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    // Gọi lệnh GET để lấy dữ liệu từ Internet
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data); // Giải mã JSON thành biến Dart
    } else {
      print('Lỗi mạng: ${response.statusCode}');
    }
  }
}
