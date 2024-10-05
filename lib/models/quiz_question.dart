// models/quiz_question.dart

class QuizQuestion {
  final String question;            // Pertanyaan
  final List<String> options;       // Pilihan jawaban (untuk pilihan ganda)
  final String? answer;             // Jawaban esai (jika ada)
  final String? correctAnswer;      // Jawaban benar (untuk pilihan ganda)
  final bool isEssay;               // Menandakan apakah ini adalah soal esai

  QuizQuestion({
    required this.question,
    required this.options,
    this.answer,
    this.correctAnswer,
    this.isEssay = false,
  });
}
