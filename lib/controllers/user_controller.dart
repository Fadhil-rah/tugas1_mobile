// controllers/user_controller.dart

import 'package:flutter/material.dart';
import '../views/quiz_home.dart';
import '../views/profile_page.dart';
import '../views/quiz_page.dart';

class UserController {
  // Fungsi untuk menavigasi ke halaman QuizHome
  Widget navigateToQuizHome(String userName) {
    return QuizHome(userName: userName);
  }

  // Fungsi untuk menavigasi ke halaman ProfilePage
  Widget navigateToProfilePage(String userName) {
    return ProfilePage(userName: userName);
  }

  // Fungsi untuk menavigasi ke halaman QuizPage
  Widget navigateToQuizPage() {
    return QuizPage();
  }
}
