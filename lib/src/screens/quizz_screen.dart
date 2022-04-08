import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_racer/src/controllers/question_controller.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/screens/quizz_components/body.dart';

class QuizScreen extends StatefulWidget {
  final Quizz quizz;
  final Category category;

  const QuizScreen({Key? key, required this.quizz, required this.category})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {

    currentIdCategory = widget.category.idCategory;
    currentIdQuizz = widget.quizz.idQuizz;
    var questions = widget.quizz.questions;

    Get.delete<QuestionController>();
    QuestionController _controller =
        Get.put(QuestionController(optionsData: questions));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        title: Text(widget.quizz.quizzName),
        backgroundColor: widget.category.backgroundColor.toColor(),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: _controller.nextQuestion,
              child: const Text(
                "Saltar",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Body(
        category: widget.category,
      ),
    );
  }
}
