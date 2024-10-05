// views/quiz_home.dart

import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../views/quiz_page.dart';

class QuizHome extends StatelessWidget {
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _userController.navigateToQuizPage(),
              ),
            );
          },
          child: Text('Mulai Kuis'),
        ),
      ),
    );
  }
}
