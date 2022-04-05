import 'package:iq_racer/src/models/answer.dart';

class Question {
  final int idQuestion;
  final String text;
  final List<Answer> answers;
  final String solution;
  bool isLocked;
  Answer? selectedOption;

  Question({
    required this.idQuestion,
    required this.text,
    required this.answers,
    required this.solution,
    this.isLocked = false,
    required this.selectedOption,
  });
}