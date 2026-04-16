import 'package:flutter/material.dart';
import 'input_page.dart'; // Import màn hình bạn vừa code

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Thiết lập Theme màu tối cho toàn bộ app
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
      ),
      home: InputPage(), // Chạy màn hình InputPage đầu tiên
    );
  }
}
