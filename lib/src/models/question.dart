import 'package:iq_racer/src/models/answer.dart';

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.answer,
    required this.question,
    required this.options,
  });
}