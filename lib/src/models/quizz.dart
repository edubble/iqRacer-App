import 'package:iq_racer/src/models/question.dart';

class Quizz {
  final int idQuizz;
  final String quizzName;
  final int idCategory;
  final int idLevel;
  final int numQuestions;
  final List questions;

  Quizz({
    required this.idQuizz,
    required this.quizzName,
    required this.idCategory,
    required this.idLevel,
    required this.numQuestions,
    required this.questions,
  });
}
