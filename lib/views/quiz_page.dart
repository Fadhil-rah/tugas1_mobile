// views/quiz_page.dart

import 'package:flutter/material.dart';
import '../data/quiz_data.dart'; // Pastikan Anda sudah mengimpor data kuis yang tepat
import '../models/quiz_question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _checkAnswer(String selectedAnswer) {
    final correctAnswer = quizQuestions[_currentQuestionIndex].correctAnswer;

    setState(() {
      if (selectedAnswer == correctAnswer) {
        _score++;
      }
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= quizQuestions.length) {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Skor Anda'),
          content: Text('Anda mendapatkan $_score dari ${quizQuestions.length} pertanyaan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                });
              },
              child: Text('Ulangi'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Kembali ke halaman QuizHome
              },
              child: Text('Kembali ke Beranda'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            for (var option in question.options)
              ElevatedButton(
                onPressed: () => _checkAnswer(option),
                child: Text(option),
              ),
          ],
        ),
      ),
    );
  }
}
