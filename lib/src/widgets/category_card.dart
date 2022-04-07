import 'package:flutter/material.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/screens/quizz_levels_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuizzLevels(
            quizzes: category.quizz, category: category,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: category.backgroundColor.toColor(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.categoryName,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Container(
                        padding: const EdgeInsets.all(9),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Color.fromRGBO(255, 255, 255, 0.38)),
                        child: Image.asset(
                          "assets/images/${category.imageUrl}",
                          height: MediaQuery.of(context).size.width * 0.05,
                        ))
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.142,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Color.fromRGBO(255, 255, 255, 0.38)),
                  child: Text(
                    category.description,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}