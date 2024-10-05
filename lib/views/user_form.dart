// views/user_form.dart

import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  bool isDarkTheme = false;
  final UserController _userController = UserController();

  void _startQuiz() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => _userController.navigateToQuizHome(_name), // Kirim _name
        ),
      );
    }
  }

  void _toggleTheme(bool? value) {
    setState(() {
      isDarkTheme = value ?? false;
    });
  }

  void _navigateToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _userController.navigateToProfilePage(_name),
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
                'Masukkan Nama Anda',
                style: TextStyle(
                  fontSize: width > 600 ? 32 : 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.blue[900]),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Nama hanya boleh mengandung huruf';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
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
