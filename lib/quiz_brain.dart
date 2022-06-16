import 'question.dart';

class QuizBrain {
  bool finished = false;

  int _questionNumber = 0;

  List<Question> _questions = [
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
  ];

  String getQuestionText() => _questions[_questionNumber].questionText;

  void nextQuestion() async {
    if (_questionNumber < _questions.length - 1) _questionNumber++;
  }

  bool lastQuestion() {
    if (_questionNumber == _questions.length - 1) {
      finished = true;
      return true;
    } else {
      return false;
    }
    ;
  }

  bool getQuestionAwnser() => _questions[_questionNumber].questionAwnser;

  int getQuestionLength() => _questions.length;

  void reset() {
    _questionNumber = 0;
  }
}
