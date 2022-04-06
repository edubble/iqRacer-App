import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: question.answers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: buildOption(context, question.answers[index]),
          );
        },
      );

  Widget buildOption(BuildContext context, Answer option) {
    final color = getColorForOption(option, question);

    return GestureDetector(
      onTap: () {
        onClickedOption(option);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildAnswer(option),
            // buildSolution(question.selectedOption, option),
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Answer option) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: option.code + ". ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                TextSpan(
                    text: option.text, style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
        ),
      );

  Color getColorForOption(Answer answer, Question question) {
    final isSelected = answer == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      if (answer.isCorrect == 1) {
        return Colors.green;
      }

      return answer.isCorrect == 1 ? Colors.green : Colors.red;
    }
  }
}

int getCorrectAwnserIndex(Question question) {
  int index = 0;
  List<Answer> answers = question.answers;

  for (var i = 0; i < answers.length; i++) {
    if (answers[i].isCorrect == 1) {
      return i;
    }
  }

  return index;
}
