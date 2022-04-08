import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/menu_container.dart';
import 'package:iq_racer/src/screens/quizz_screen.dart';
// import 'package:iq_racer/src/screens/quiz/quiz_screen.dart';

// ignore: camel_case_types
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final colorstheme = const Color(0xff4b4b87);

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
                return AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: const ParticleOptions(
                      spawnMaxRadius: 25,
                      spawnMinRadius: 8.00,
                      particleCount: 100,
                      spawnMaxSpeed: 50.00,
                      spawnMinSpeed: 5.00,
                      minOpacity: 0.3,
                      spawnOpacity: 0.5,
                      baseColor: Colors.orange,
                      //  image: Image(image: AssetImage("assets/images/confetti.png")),
                    ),
                  ),
                  vsync: this,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x80000000),
                                  blurRadius: 12.0,
                                  offset: Offset(0.0, 5.0),
                                ),
                              ],
                              gradient: const LinearGradient(
                                colors: [
                                  (Color(0xffF5591F)),
                                  (Color(0xffF2861E))
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                          categories: categoriesList)),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                'JUGAR',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
      List questions = getListQuestions(idQuizz, dbQuestions, dbAnswer);

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

List getListQuestions(int idQuizz, List dbQuestions, List dbAnswer) {
  List questions = [];

  for (var item in dbQuestions) {
    if (item["id_quizz"] == idQuizz) {
      int idQuestion = item["id_question"];
      String questionText = item["question_text"];
      Map mapAnswers = getAnswers(idQuestion, dbAnswer);

      Map question = {
        'id': idQuestion,
        'question': questionText,
        'options': mapAnswers["answers"],
        'answer_index': mapAnswers["answer_index"]
      };

      questions.add(question);
    }
  }

  return questions;
}

Map getAnswers(int idQuestion, List dbAnswer) {
  List<String> answers = [];
  Map dataAnswers;
  int correctIndex = 0;
  int counter = 0;

  for (var item in dbAnswer) {
    if (item["id_question"] == idQuestion) {
      String optionText = item["answer_text"];
      int isCorrecte = item["is_correct"];

      if (isCorrecte == 1) {
        correctIndex = counter;
      } else {
        counter++;
      }

      answers.add(optionText);
    }
  }

  dataAnswers = {"answers": answers, "answer_index": correctIndex};

  return dataAnswers;
}
