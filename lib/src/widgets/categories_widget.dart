import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/widgets/category_card.dart';

class CategoriesTab extends StatelessWidget {
  final List<Category> categories;

  const CategoriesTab({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
