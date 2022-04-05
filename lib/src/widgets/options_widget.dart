import 'package:flutter/material.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/answer.dart';
import 'package:iq_racer/src/models/question.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Answer> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        physics: const BouncingScrollPhysics(),
        children: Utils.heightBetween(
          question.answers
              .map((option) => buildOption(context, option))
              .toList(),
          height: 8,
        ),
      );

  Widget buildOption(BuildContext context, Answer option) {
    final color = getColorForOption(option, question);

    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildAnswer(option),
            buildSolution(question.selectedOption, option),
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Answer option) => Container(
        height: 50,
        child: Row(
          children: [
            Text(
              option.code,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(width: 12),
            Text(
              option.text,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      );

  Widget buildSolution(Answer? solution, Answer answer) {
    if (solution == answer) {
      return Text(
        question.solution,
        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      );
    } else {
      return Container();
    }
  }

  Color getColorForOption(Answer answer, Question question) {
    final isSelected = answer == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return answer.isCorrect == 1 ? Colors.green : Colors.red;
    }
  }
}
