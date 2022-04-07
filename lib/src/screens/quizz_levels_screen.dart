import 'package:flutter/material.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/screens/quiz_screen.dart';

class QuizzLevels extends StatefulWidget {
  const QuizzLevels({Key? key, required this.quizzes, required this.category}) : super(key: key);

  final List<Quizz> quizzes;
  final Category category;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<QuizzLevels> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoryName),
        elevation: 6,
        backgroundColor: widget.category.backgroundColor.toColor(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              containerFotoNombre(context, "assets/images/${widget.category.imageUrl}"),
              contenido(context, widget.quizzes, widget.category)
            ],
          ),
        ),
      ),
    );
  }
}

Widget nombreCategoria(BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text("Elige un nivel",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)));
}

Widget containerFotoNombre(BuildContext context, String imagePath) {
  return Center(
      child: SizedBox(
    height: 180,
    width: 229,
    child: Column(
      children: [fotoCategoria(context, imagePath), nombreCategoria(context)],
    ),
  ));
}

Widget fotoCategoria(BuildContext context, String imagePath) {
  return SizedBox(
    height: 120,
    width: 120,
    child: Column(
      children: [Image.asset(imagePath)],
    ),
  );
}

Widget contenido(BuildContext context, List<Quizz> quizzes, Category category) {
  List quizzLevels = [
    {"dificulty": "Aprendiz", "image": "assets/images/Aprendiz.png"},
    {"dificulty": "Principiante", "image": "assets/images/Principiante.png"},
    {"dificulty": "Moderado", "image": "assets/images/Moderado.png"},
    {"dificulty": "Avanzado", "image": "assets/images/Avanzado.png"},
    {"dificulty": "Experto", "image": "assets/images/Experto.png"},
  ];
  return Column(children: [
    Container(
        height: 450,
        width: 350,
        margin: const EdgeInsets.only(top: 20, right: 5),
        child: ListView.builder(
          itemCount: quizzLevels.length,
          itemBuilder: (context, index) {
            String dificulty = quizzLevels[index]["dificulty"];
            String imageD = quizzLevels[index]["image"];

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuizScreen(quizz: quizzes[index], category: category,),
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Image.asset(
                            imageD,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            dificulty,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  indent: 25,
                  endIndent: 10,
                  color: category.backgroundColor.toColor(),
                )
              ],
            );
          },
        )),
  ]);
}
