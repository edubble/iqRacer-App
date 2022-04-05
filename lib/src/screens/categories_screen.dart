import 'package:flutter/material.dart';
import 'package:iq_racer/src/mock_data/db_data/anwers.dart';
import 'package:iq_racer/src/mock_data/db_data/categories.dart';
import 'package:iq_racer/src/mock_data/db_data/questions.dart';
import 'package:iq_racer/src/mock_data/db_data/quizzes.dart';
import 'package:iq_racer/src/models/answer.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/question.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/screens/login_screen.dart';
import 'package:iq_racer/src/widgets/categories_widget.dart';

// ignore: camel_case_types
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  // final Users user;
  // Preguntas(this.user);

  @override
  // _PreguntasState createState() => _PreguntasState(user);
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  final colorstheme = const Color(0xff4b4b87);

  TabController? _tabController;

  // final Users user;
  // _PreguntasState(this.user);

  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
    for (var item in categoriesList) {

      print("Categoria: " + item.categoryName);

      var quizz = item.quizz;

      for (var item in quizz) {

        var question = item.questions;

        for (var item in question) {

          print("Pregunta: " + item.text);
          var answers = item.answers;

          for (var item in answers) {

            print(item.code + ": " + item.text);
            
          }

          print("--------------");
          
        }

        
        
      }
      
  }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Category> categoriesList = getListCategories(categories, quizzes, questions, answers);

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _key,
        // drawer: Menu_lateral(user),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: TabBar(
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.all(10),
                  labelColor: Colors.white,
                  unselectedLabelColor: colorstheme,
                  labelStyle: const TextStyle(fontSize: 20),
                  labelPadding: const EdgeInsets.only(
                      left: 35, right: 35, top: 10, bottom: 10),
                  indicator: BoxDecoration(
                      color: colorstheme,
                      borderRadius: BorderRadius.circular(20)),
                  controller: _tabController,
                  tabs: const [
                    Text('Por temas'),
                    // Text('Aleatorio'),
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                CategoriesTab(categories: categoriesList),
              ]),
            )
          ],
        ),
      );
}

List<Category> getListCategories(List cats, List dbQuizzes, List dbQuestions, List dbAnswer) {
  List<Category> ucategories = [];

  for (var item in cats) {
    int idCategory = item["id_category"];
    String name = item["name"];
    String description = item["description"];
    String image = item["category_image"];
    String backColor = item["background_color"];
    List<Quizz> catQuizzs = getListQuizzes(idCategory, dbQuizzes, dbQuestions, dbAnswer);

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

List<Quizz> getListQuizzes(int idCategory, List dbQuizzes, List dbQuestions, List dbAnswer) {
  List<Quizz> quizzes = [];

  for (var item in dbQuizzes) {
    if (item["id_category"] == idCategory) {
      int idQuizz = item["id_quizz"];
      String quizzName = item["name"];
      int idCategory = item["id_category"];
      int idLevel = item["id_level"];
      int numQuestions = item["num_questions"];
      List<Question> questions = getListQuestions(idQuizz, dbQuestions, dbAnswer);

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
