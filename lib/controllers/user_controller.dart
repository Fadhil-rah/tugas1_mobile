import 'package:flutter/material.dart';
import '../views/quiz_home.dart';
import '../views/profile_page.dart';
import '../views/quiz_page.dart';

class UserController {
  // Fungsi untuk menavigasi ke halaman QuizHome
  Widget navigateToQuizHome() {
    return QuizHome(); // Tanpa parameter userName
  }

  // Fungsi untuk menavigasi ke halaman ProfilePage
  Widget navigateToProfilePage() {
    return ProfilePage(); // Tanpa parameter userName
  }

  // Fungsi untuk menavigasi ke halaman QuizPage
  Widget navigateToQuizPage() {
    return QuizPage();
  }
}
