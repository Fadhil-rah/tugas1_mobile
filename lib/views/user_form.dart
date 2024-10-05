// views/user_form.dart

import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  bool isDarkTheme = false;
  final UserController _userController = UserController();

  void _startQuiz() {
    // Langsung navigasi ke QuizHome tanpa validasi nama
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _userController.navigateToQuizHome(),
      ),
    );
  }

  void _toggleTheme(bool? value) {
    setState(() {
      isDarkTheme = value ?? false;
    });
  }

  void _navigateToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _userController.navigateToProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: _navigateToProfile,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(width * 0.05),
        decoration: BoxDecoration(
          gradient: isDarkTheme
              ? LinearGradient(
            colors: [Colors.black87, Colors.grey[850]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : LinearGradient(
            colors: [Colors.lightBlue[100]!, Colors.blue[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mulai Kuis Sekarang!',
                style: TextStyle(
                  fontSize: width > 600 ? 32 : 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tema Gelap',
                    style: TextStyle(color: isDarkTheme ? Colors.white : Colors.blue[900]),
                  ),
                  Switch(
                    value: isDarkTheme,
                    onChanged: _toggleTheme,
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                onPressed: _startQuiz,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: width * 0.1),
                ),
                child: Text(
                  'Mulai Kuis',
                  style: TextStyle(fontSize: width > 600 ? 24 : 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
