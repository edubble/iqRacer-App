import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/answer.dart';
import 'package:iq_racer/src/models/question.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/widgets/question_numbers_widget.dart';
import 'package:iq_racer/src/widgets/questions_widget.dart';

class QuizzPage extends StatefulWidget {
  final Quizz quizz;

  const QuizzPage({Key? key, required this.quizz}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  late PageController controller;
  late Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.quizz.questions.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.quizz.quizzName),
          // actions: [
          //   TextButton(
          //       onPressed: () => (index) => nextQuestion(index: index, jump: true),
          //       child: const Text("Saltar"))
          // ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffF5591F), Color(0xffF2861E)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
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
    }
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
