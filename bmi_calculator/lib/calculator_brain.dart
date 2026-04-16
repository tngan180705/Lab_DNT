import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  // Biến private để lưu giá trị BMI sau khi tính
  double _bmi = 0;

  // Hàm tính toán chỉ số BMI
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); // Trả về chuỗi có 1 chữ số thập phân
  }

  // Hàm trả về phân loại kết quả (Dòng chữ lớn)
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // ĐÂY LÀ HÀM BẠN ĐANG THIẾU: Trả về lời khuyên (Dòng chữ nhỏ)
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Bạn có trọng lượng cơ thể cao hơn bình thường. Hãy cố gắng tập thể dục nhiều hơn nhé!';
    } else if (_bmi >= 18.5) {
      return 'Bạn có một trọng lượng cơ thể bình thường. Tuyệt vời!';
    } else {
      return 'Bạn có trọng lượng cơ thể thấp hơn bình thường. Bạn nên ăn uống đầy đủ hơn một chút.';
    }
  }
}
