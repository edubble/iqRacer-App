import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/screens/menu_container.dart';

class ScoreScreen extends StatelessWidget {
  final int correctAnswers;
  final int quizzLength;

  const ScoreScreen(
      {Key? key, required this.correctAnswers, required this.quizzLength,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var values = getValuesScore(correctAnswers);

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: currentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$correctAnswers / $quizzLength",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60.00,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                values["text"],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48.00,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              Image(
                  height: 200, width: 200, image: AssetImage(values["image"])),
              const SizedBox(height: 40.0),
              ElevatedButton.icon(
                label: const Text(
                  "Volver",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  maximumSize: const Size(700, 200),
                  minimumSize: const Size(200, 100),
                ),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                            categories: categoriesList)),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map getValuesScore(int score) {
  List values = [
    {
      "image": "assets/images/failedTest.png",
      "text": "¡Oops!",
      "max_number": [0, 4]
    },
    {
      "image": "assets/images/medallaBronce.png",
      "text": "¡Bien jugado!",
      "max_number": [5, 6]
    },
    {
      "image": "assets/images/medallaPlata.png",
      "text": "¡Genio!",
      "max_number": [7, 8]
    },
    {
      "image": "assets/images/medallaOro.png",
      "text": "¡Excelente!",
      "max_number": [9, 10]
    },
  ];

  for (var item in values) {
    List numbers = item["max_number"];

    if (numbers.contains(score)) {
      return item;
    }
  }

  return values[0];
}
