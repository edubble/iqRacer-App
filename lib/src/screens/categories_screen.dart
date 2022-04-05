import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/widgets/categories_widget.dart';

// ignore: camel_case_types
class Categories extends StatefulWidget {
  const Categories({Key? key, required this.categories}) : super(key: key);

  final List<Category> categories;

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
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _key,
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
                        CategoriesTab(categories: widget.categories),
                      ]),
                    )
                  ],
                )
      );
}