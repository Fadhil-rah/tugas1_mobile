// views/quiz_home.dart

import 'package:flutter/material.dart';

class QuizHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('Selamat datang di Kuis!'),
      ),
    );
  }
}
