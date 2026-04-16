import 'package:flutter/material.dart';
import 'screens/loading_screen.dart'; // Đảm bảo đường dẫn này đúng với thư mục bạn đã tạo

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Thiết lập giao diện tối (Dark Theme) phù hợp với app Clima
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      // Màn hình đầu tiên xuất hiện sẽ là màn hình chờ lấy dữ liệu
      home: LoadingScreen(),
    );
  }
}
