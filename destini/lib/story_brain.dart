import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  List<Story> _storyData = [
    Story(
      storyTitle:
          'Xe của bạn bị hỏng lốp trên một con đường vắng vẻ. Bạn nhìn thấy một ánh đèn le lói ở căn nhà phía xa.',
      choice1: 'Đi bộ đến căn nhà tìm sự giúp đỡ.',
      choice2: 'Ở lại trong xe và chờ đợi.',
    ),
    Story(
      storyTitle:
          'Bạn đến gần căn nhà và thấy một người đàn ông lạ mặt đang cầm rìu.',
      choice1: 'Hỏi mượn điện thoại.',
      choice2: 'Bỏ chạy quay lại xe.',
    ),
    Story(
      storyTitle:
          'Người đàn ông nói: "Điện thoại hỏng rồi, nhưng tôi có thể giúp sửa xe".',
      choice1: 'Tin tưởng ông ta.',
      choice2: 'Cảm ơn và rời đi ngay lập tức.',
    ),
    // Bạn có thể thêm các Story kết thúc tại đây
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;
  String getChoice1() => _storyData[_storyNumber].choice1;
  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    // Logic điều hướng dựa trên lựa chọn
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 2;
    } else {
      restart();
    }
  }

  void restart() => _storyNumber = 0;

  // Kiểm tra xem có nên hiện nút thứ 2 không (nếu là kết thúc thì ẩn đi)
  bool buttonShouldBeVisible() => _storyNumber < 2;
}
