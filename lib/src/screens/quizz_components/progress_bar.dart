import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iq_racer/src/constants.dart';
import 'package:iq_racer/src/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/category.dart';

class ProgressBar extends StatelessWidget {

  final Category category;

  const ProgressBar({
    Key ?key, required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: category.backgroundColor.toColor(), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(optionsData: []),
        builder: (controller) {
          return Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  color: category.backgroundColor.toColor(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
