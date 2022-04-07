import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_racer/src/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iq_racer/src/controllers/question_controller.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/screens/menu_container.dart';

class ScoreScreen extends StatelessWidget {
  final int correctAnswers;
  final int quizzLength;

  const ScoreScreen(
      {Key? key, required this.correctAnswers, required this.quizzLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${correctAnswers * 10}/${quizzLength * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              user: currentUser, categories: categoriesList)),
                      (route) => false,
                    );

                  },
                  child: Text("Volver"))
            ],
          )
        ],
      ),
    );
  }
}
