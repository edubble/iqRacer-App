import 'package:flutter/material.dart';
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
      var userHistories = await getDataApi("user_histories");
      var idUserHistory = existsUserHistory(userHistories);

      print(idUserHistory);

      if (idUserHistory != -1) {
        print('Update!');
        updateUserHistory(_numOfCorrectAns, idUserHistory);
      } else {
        createUserHistory(_numOfCorrectAns);
        print('Create!');
      }

      userHistories = await getDataApi("user_histories");
      var allQuizzes = checkIfAllQuizzes(userHistories, 1);

      if (allQuizzes[0]) {
        createUserTrophy(allQuizzes[1]);
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

existsUserHistory(dynamic jsonData) {
  for (var item in jsonData) {
    if (item["id_user"] == currentUser.id &&
        item["id_quizz"] == currentIdQuizz) {
      return item["id_user_histories"];
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

showDoneSnackBar(BuildContext context, int myColor, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Color(myColor),
      duration: const Duration(milliseconds: 1000)));
}

checkIfAllQuizzes(dynamic histories, int idQuizz) {
  int currentIdHistories = 0;

  int counter = 0;

  List idQuizzes = [];
  List alreadyIn = [];

  if (currentIdCategory == 1) {
    idQuizzes = [1, 2, 3, 5];
  } else if (currentIdCategory == 2) {
    idQuizzes = [6, 7, 8, 9, 10];
  } else if (currentIdCategory == 3) {
    idQuizzes = [11, 12, 13, 14, 15];
  } else if (currentIdCategory == 4) {
    idQuizzes = [16, 17, 18, 19, 20];
  } else if (currentIdCategory == 5) {
    idQuizzes = [21, 22, 23, 24, 25];
  } else if (currentIdCategory == 6) {
    idQuizzes = [26, 27, 28, 29, 30];
  } else if (currentIdCategory == 7) {
    idQuizzes = [31, 31, 33, 34, 35];
  } else {
    idQuizzes = [26, 37, 38, 39, 40];
  }

  for (var item in histories) {
    if (idQuizz == item["id_user"]) {
      if (item["id_user"] == currentUser.id &&
          item["correct_answers"] >= 5 &&
          idQuizzes.contains(item["id_quizz"]) &&
          !alreadyIn.contains(item["id_quizz"])) {
        counter++;
        alreadyIn.add(item["id_quizz"]);
        currentIdHistories = item["id_user_histories"];
      }
    }
  }

  return [counter >= 5, currentIdHistories];
}

Future getDataApi(String table) async {
  String url = "http://rogercr2001-001-site1.itempurl.com/api/${table}";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    return jsonData;
  }
}

Future createUserTrophy(int idHistory) async {
  int idTrophy = 0;

  if (currentIdCategory == 1) {
    idTrophy = 9;
  } else if (currentIdCategory == 2) {
    idTrophy = 10;
  } else if (currentIdCategory == 3) {
    idTrophy = 11;
  } else if (currentIdCategory == 4) {
    idTrophy = 12;
  } else if (currentIdCategory == 5) {
    idTrophy = 13;
  } else if (currentIdCategory == 6) {
    idTrophy = 14;
  } else if (currentIdCategory == 7) {
    idTrophy = 15;
  } else {
    idTrophy = 16;
  }

  var url = "http://rogercr2001-001-site1.itempurl.com/api/user_trophies";

  Map data = {
    "id_user_histories": idHistory,
    "id_trophy": idTrophy,
    "latitude": 41.394209639341035,
    "longitude": 2.1280800907598505,
    "date_add": "2022-02-08T00:00:00"
  };

  var body = json.encode(data);
  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  var statusCode = response.statusCode;

  return statusCode;
}
