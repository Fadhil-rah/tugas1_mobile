// controllers/quiz_controller.dart

class QuizController {
  final List<Map<String, Object>> questions = [
    {
      'question': 'Apa ibukota Indonesia?',
      'answers': ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
      'correctAnswer': 'Jakarta',
    },
    {
      'question': 'Siapa presiden pertama Indonesia?',
      'answers': ['Soeharto', 'Jokowi', 'Soekarno', 'Habibie'],
      'correctAnswer': 'Soekarno',
    },
  ];

  int questionIndex = 0;

  String get currentQuestion {
    return questions[questionIndex]['question'] as String;
  }

  List<String> get currentAnswers {
    return questions[questionIndex]['answers'] as List<String>;
  }

  void answerQuestion(String answer) {
    if (answer == questions[questionIndex]['correctAnswer']) {
      print('Jawaban Benar!');
    } else {
      print('Jawaban Salah!');
    }

    questionIndex++;
  }
}
