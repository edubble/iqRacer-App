import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/models/question.dart';
import 'package:iq_racer/src/screens/score_screen.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Lets animated our progress bar

  QuestionController({required this.optionsData});

  late List optionsData;

  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  late List<Question> _questions;

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  // for more about obs please check documentation
  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();

    _questions = optionsData
        .map(
          (question) => Question(
              id: question['id'],
              question: question['question'],
              options: question['options'],
              answer: question['answer_index']),
        )
        .toList();

    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() async {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      var idUserHistory = await existsUserHistory();

      print(idUserHistory);

      if (idUserHistory != -1) {
        print('Update!');
        updateUserHistory(_numOfCorrectAns, idUserHistory);
      } else {
        createUserHistory(_numOfCorrectAns);
        print('Create!');
      }

      // Get package provide us simple way to naviigate another page
      Get.to(() => ScoreScreen(
          correctAnswers: _numOfCorrectAns, quizzLength: questions.length));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}

Future createUserHistory(int correctAns) async {
  var url = "http://rogercr2001-001-site1.itempurl.com/api/user_histories";

  Map data = {
    "id_user": currentUser.id,
    "id_quizz": currentIdQuizz,
    "status": 1,
    "correct_answers": correctAns,
    "best_time": 0.0
  };

  var body = json.encode(data);
  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  var statusCode = response.statusCode;

  if (response.statusCode == 200) {
    print(currentIdQuizz);
  }
  return statusCode;
}

existsUserHistory() async {
  String url = "http://rogercr2001-001-site1.itempurl.com/api/user_histories";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    for (var item in jsonData) {
      if (item["id_user"] == currentUser.id &&
          item["id_quizz"] == currentIdQuizz) {
        return item["id_user_histories"];
      }
    }
  }
  return -1;
}

Future updateUserHistory(int correctAns, idUserHistory) async {
  var url =
      "http://rogercr2001-001-site1.itempurl.com/api/user_histories/$idUserHistory";

  Map data = {
    "id_user_histories": idUserHistory,
    "id_user": currentUser.id,
    "id_quizz": currentIdQuizz,
    "status": 1,
    "correct_answers": correctAns,
    "best_time": 0.0
  };

  var body = json.encode(data);
  var response = await http.put(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  var statusCode = response.statusCode;

  if (response.statusCode == 200) {
    print(currentIdQuizz);
  }
  return statusCode;
}
