import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/quizz.dart';
import 'package:iq_racer/src/models/user.dart';

User currentUser = User(
  1,
  "",
  "",
  "",
  "",
  "",
  1,
  1,
  "",
  "assets/images/trevor-pic.webp",
);

int currentIdQuizz = 0;
int currentIdCategory = 1;
Color currentColor = const Color(0xffF2861E);

List<Category> categoriesList = [];