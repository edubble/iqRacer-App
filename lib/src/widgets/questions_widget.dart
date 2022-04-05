import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/answer.dart';
import 'package:iq_racer/src/models/question.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/widgets/options_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final Quizz quizz;
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Answer> onClickedOption;

  const QuestionsWidget({
    Key? key,
    required this.quizz,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView.builder(
        onPageChanged: onChangedPage,
        controller: controller,
        itemCount: quizz.questions.length,
        itemBuilder: (context, index) {
          final question = quizz.questions[index];

          return buildQuestion(question: question);
        },
      );

  Widget buildQuestion({
    required Question question,
  }) =>
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              question.text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecciona una respuesta',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: OptionsWidget(
                question: question,
                onClickedOption: onClickedOption,
              ),
            ),
          ],
        ),
      );
}
