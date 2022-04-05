import 'package:iq_racer/src/models/quizz.dart';

class Category {
  final int idCategory;
  final String categoryName;
  final String description;
  final String backgroundColor;
  final List<Quizz> quizz;
  final String imageUrl;

  Category({
    required this.idCategory,
    required this.imageUrl,
    required this.quizz,
    required this.categoryName,
    this.description = '',
    required this.backgroundColor,
  });
}
