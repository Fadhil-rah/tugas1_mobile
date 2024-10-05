import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  bool isDarkTheme = false;

  void _startQuiz() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => QuizHome(userName: _name)),
      );
    }
  }

  void _toggleTheme(bool? value) {
    setState(() {
      isDarkTheme = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan MediaQuery untuk menentukan ukuran layar
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(width * 0.05), // Mengatur padding responsif
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
                  fontSize: width > 600 ? 32 : 24, // Mengatur ukuran font responsif
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02), // Mengatur jarak responsif
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(color: isDarkTheme ? Colors.white : Colors.blue[900]),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
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
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: width * 0.1), // Mengatur padding responsif
                ),
                child: Text(
                  'Mulai Kuis',
                  style: TextStyle(fontSize: width > 600 ? 24 : 18), // Mengatur ukuran font responsif
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizHome extends StatefulWidget {
  final String userName;

  QuizHome({required this.userName});

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
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
    // Tambahkan pertanyaan lain di sini
  ];

  int questionIndex = 0;

  void answerQuestion(String answer) {
    if (answer == questions[questionIndex]['correctAnswer']) {
      print('Jawaban Benar!');
    } else {
      print('Jawaban Salah!');
    }

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan MediaQuery untuk menentukan ukuran layar
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[100]!, Colors.blue[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: questionIndex < questions.length
            ? Padding(
          padding: EdgeInsets.all(width * 0.05), // Mengatur padding responsif
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[questionIndex]['question'] as String,
                style: TextStyle(
                  fontSize: width > 600 ? 32 : 24, // Mengatur ukuran font responsif
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: width * 0.1), // Mengatur padding responsif
                    ),
                    onPressed: () => answerQuestion(answer),
                    child: Text(
                      answer,
                      style: TextStyle(fontSize: width > 600 ? 24 : 18), // Mengatur ukuran font responsif
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        )
            : Center(
          child: Text(
            'Quiz Selesai! Terima kasih, ${widget.userName}!',
            style: TextStyle(fontSize: width > 600 ? 32 : 24, color: Colors.blue[900]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
