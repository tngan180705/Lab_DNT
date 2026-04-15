import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  // Hàm phát nhạc đơn giản, trực tiếp
  void playSound(int noteNumber) {
    final player = AudioPlayer();
    // Thư viện sẽ tự tìm trong thư mục assets/
    player.play(AssetSource('note$noteNumber.wav'));
  }

  // Hàm tạo phím đàn giúp code ngắn gọn
  Widget buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () => playSound(noteNumber),
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, noteNumber: 1),
              buildKey(color: Colors.orange, noteNumber: 2),
              buildKey(color: Colors.yellow, noteNumber: 3),
              buildKey(color: Colors.green, noteNumber: 4),
              buildKey(color: Colors.teal, noteNumber: 5),
              buildKey(color: Colors.blue, noteNumber: 6),
              buildKey(color: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
