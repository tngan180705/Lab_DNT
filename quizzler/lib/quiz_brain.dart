import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Sông vông chảy qua Hà Nội đúng không?', true),
    Question('Mặt trời mọc ở hướng Tây.', false),
    Question('Flutter được phát triển bởi Google.', true),
    // Bạn có thể thêm nhiều câu hỏi ở đây
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() => _questionBank[_questionNumber].questionText;
  bool getQuestionAnswer() => _questionBank[_questionNumber].questionAnswer;
  bool isFinished() => _questionNumber >= _questionBank.length - 1;
  void reset() => _questionNumber = 0;
}
