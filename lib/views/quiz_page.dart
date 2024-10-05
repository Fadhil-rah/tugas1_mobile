// views/quiz_page.dart

import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../data/quiz_data.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  List<String?> _userAnswers = List.filled(quizQuestions.length, null);

  void _nextQuestion() {
    if (_currentQuestionIndex < quizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _submitQuiz() {
    // Menghitung skor
    int score = 0;
    for (int i = 0; i < quizQuestions.length; i++) {
      if (_userAnswers[i] == quizQuestions[i].correctAnswer) {
        score++;
      }
    }

    // Menampilkan dialog hasil
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hasil Kuis'),
          content: Text('Anda mendapatkan $score dari ${quizQuestions.length} pertanyaan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
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
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (!question.isEssay) ...[
              for (var option in question.options)
                RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _userAnswers[_currentQuestionIndex],
                  onChanged: (value) {
                    setState(() {
                      _userAnswers[_currentQuestionIndex] = value;
                    });
                  },
                ),
            ] else ...[
              TextFormField(
                decoration: InputDecoration(labelText: 'Jawaban Anda'),
                onChanged: (value) {
                  _userAnswers[_currentQuestionIndex] = value;
                },
              ),
            ],
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousQuestion,
                  child: Text('Sebelumnya'),
                ),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text('Selanjutnya'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitQuiz,
              child: Text('Kirim Jawaban'),
            ),
          ],
        ),
      ),
    );
  }
}
