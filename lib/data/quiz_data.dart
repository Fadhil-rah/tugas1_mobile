// data/quiz_data.dart

import '../models/quiz_question.dart';

final List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: 'Apa ibukota Indonesia?',
    options: ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
    correctAnswer: 'Jakarta',
    isEssay: false,
  ),
  QuizQuestion(
    question: 'Apa warna langit saat cerah?',
    options: ['Merah', 'Biru', 'Kuning', 'Hijau'],
    correctAnswer: 'Biru',
    isEssay: false,
  ),
  QuizQuestion(
    question: 'Jelaskan apa itu ekosistem.', // Soal esai
    options: [],
    answer: null,
    isEssay: true,
  ),
  // Tambahkan pertanyaan lain sesuai kebutuhan
];
