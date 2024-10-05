import 'package:flutter/material.dart';
import 'views/quiz_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizHome(userName: 'User'), // Replace with a default user or remove the parameter if not needed
    );
  }
}
