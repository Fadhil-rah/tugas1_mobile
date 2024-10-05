// data/quiz_data.dart

import '../models/quiz_question.dart';

final List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: 'Apa ibu kota Indonesia?',
    options: ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
    correctAnswer: 'Jakarta',
  ),
  QuizQuestion(
    question: 'Siapa presiden pertama Indonesia?',
    options: ['Soekarno', 'Soeharto', 'Jokowi', 'Habibie'],
    correctAnswer: 'Soekarno',
  ),
  QuizQuestion(
    question: 'Apa nama gunung tertinggi di Indonesia?',
    options: ['Gunung Semeru', 'Gunung Kerinci', 'Gunung Rinjani', 'Gunung Jayawijaya'],
    correctAnswer: 'Gunung Jayawijaya',
  ),
  QuizQuestion(
    question: 'Apa mata uang Indonesia?',
    options: ['Dollar', 'Rupiah', 'Euro', 'Yen'],
    correctAnswer: 'Rupiah',
  ),
  QuizQuestion(
    question: 'Apa nama laut di sebelah utara Indonesia?',
    options: ['Laut Jawa', 'Laut China Selatan', 'Samudera Hindia', 'Laut Banda'],
    correctAnswer: 'Laut China Selatan',
  ),
];
