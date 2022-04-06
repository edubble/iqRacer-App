import 'package:flutter/material.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/answer.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/question.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/widgets/questions_widget.dart';

class QuizzPage extends StatefulWidget {
  final Quizz quizz;
  final Category category;

  const QuizzPage({Key? key, required this.quizz, required this.category})
      : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  late PageController controller;
  late Question question;

  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.quizz.questions.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: widget.category.backgroundColor.toColor(),
          centerTitle: true,
          title: Text(widget.quizz.quizzName),
        ),
        body: QuestionsWidget(
          quizz: widget.quizz,
          controller: controller,
          onChangedPage: (index) => nextQuestion(index: index),
          onClickedOption: selectOption,
          //   key: null,
        ),
      );

  void selectOption(Answer option) {
    if (question.isLocked) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });

      if (question.selectedOption!.isCorrect == 1) {
        correctAnswers++;
      }
    }

    print(correctAnswers);

  }

  void nextQuestion({int? index, bool jump = false}) {
    final nextPage = controller.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.quizz.questions[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }
}
