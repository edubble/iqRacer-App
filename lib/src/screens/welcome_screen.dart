import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/answer.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/question.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/menu_container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final colorstheme = const Color(0xff4b4b87);

  List<Category> categoriesList = [];

  @override
  void initState() {
    doSomeAsyncStuff();

    super.initState();
  }

  Future<void> doSomeAsyncStuff() async {
    var categories = await getDataApi("categories");
    var quizzes = await getDataApi("quizzes");
    var questions = await getDataApi("questions");
    var answers = await getDataApi("answers");

    categoriesList = getListCategories(categories, quizzes, questions, answers);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _key,
        body: FutureBuilder(
            future: doSomeAsyncStuff(),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else {
                return Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(
                            user: widget.user, categories: categoriesList),
                      ));
                    },
                    child: const Text("play"),
                  ),
                );
              }
            }),
      );
}

Future getDataApi(String table) async {
  String url = "http://rogercr2001-001-site1.itempurl.com/api/${table}";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    return jsonData;
  }
}

List<Category> getListCategories(
    dynamic cats, dynamic dbQuizzes, dynamic dbQuestions, dynamic dbAnswer) {
  List<Category> ucategories = [];

  for (var item in cats) {
    int idCategory = item["id_category"];
    String name = item["name"];
    String description = item["description"];
    String image = item["category_image"];
    String backColor = item["background_color"];
    List<Quizz> catQuizzs =
        getListQuizzes(idCategory, dbQuizzes, dbQuestions, dbAnswer);

    Category newCat = Category(
      idCategory: idCategory,
      imageUrl: image,
      categoryName: name,
      backgroundColor: backColor,
      description: description,
      quizz: catQuizzs,
    );

    ucategories.add(newCat);
  }

  return ucategories;
}

List<Quizz> getListQuizzes(
    int idCategory, List dbQuizzes, List dbQuestions, List dbAnswer) {
  List<Quizz> quizzes = [];

  for (var item in dbQuizzes) {
    if (item["id_category"] == idCategory) {
      int idQuizz = item["id_quizz"];
      String quizzName = item["name"];
      int idCategory = item["id_category"];
      int idLevel = item["id_level"];
      int numQuestions = item["num_questions"];
      List<Question> questions =
          getListQuestions(idQuizz, dbQuestions, dbAnswer);

      Quizz quizz = Quizz(
          idQuizz: idQuizz,
          quizzName: quizzName,
          idCategory: idCategory,
          idLevel: idLevel,
          numQuestions: numQuestions,
          questions: questions);

      quizzes.add(quizz);
    }
  }

  return quizzes;
}

List<Question> getListQuestions(int idQuizz, List dbQuestions, List dbAnswer) {
  List<Question> questions = [];

  for (var item in dbQuestions) {
    if (item["id_quizz"] == idQuizz) {
      int idQuestion = item["id_question"];
      String questionText = item["question_text"];
      String solutionText = item["solution_text"];
      List<Answer> answers = getListAnswers(idQuestion, dbAnswer);

      Question question = Question(
          idQuestion: idQuestion,
          text: questionText,
          answers: answers,
          solution: solutionText,
          selectedOption: null);

      questions.add(question);
    }
  }

  return questions;
}

List<Answer> getListAnswers(int idQuestion, List dbAnswer) {
  List<Answer> answers = [];

  for (var item in dbAnswer) {
    if (item["id_question"] == idQuestion) {
      int idAnswer = item["id_answer"];
      String answerText = item["answer_text"];
      String code = item["code_answer"];
      int isCorrect = item["is_correct"];

      Answer answer = Answer(
          idAnswer: idAnswer,
          text: answerText,
          code: code,
          isCorrect: isCorrect);

      answers.add(answer);
    }
  }

  return answers;
}
