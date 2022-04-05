import 'package:flutter/material.dart';
import 'package:iq_racer/src/screens/detail_trophy_screen.dart';
import 'package:iq_racer/src/widgets/trophy_card_widget.dart';

class TrophiesPage extends StatefulWidget {
  const TrophiesPage({Key? key}) : super(key: key);

  @override
  State<TrophiesPage> createState() => _TrophiesPageState();
}

class _TrophiesPageState extends State<TrophiesPage> {
  List trophies = [
    {
      "title": "Historia",
      "images": ["assets/images/mindful.jpeg", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,
    },
    {
      "title": "Arte y literatura",
      "images": ["assets/images/gopher2.jpeg", "assets/images/mindful.jpeg"],
      "achieved": 1,
      "dateTime": "14/12/2001 14:56:10",
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
    {
      "title": "Entretenimento",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 1,
      "dateTime": "14/12/2001 14:56:10",
       "address": "Salesians Sarrià, Barcelona, España",
       "city": "Barcelona",
       "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
    {
      "title": "Videojuegos",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,

    },
    {
      "title": "Geografia",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 1,
      "dateTime": "14/12/2001 14:56:10",
       "address": "Salesians Sarrià, Barcelona, España",
       "city": "Barcelona",
       "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
    {
      "title": "Ciencia",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,

    },
    {
      "title": "Programación",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,

    },
    {
      "title": "Aleatorio",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 1,
      "dateTime": "14/12/2001 14:56:10",
       "address": "Salesians Sarrià, Barcelona, España",
       "city": "Barcelona",
       "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: trophies.length,
          itemBuilder: (BuildContext ctx, index) {
            final achieved = trophies[index]["achieved"];

            if (achieved == 0) {
              return TrophyCard(
                image: trophies[index]["images"][0],
                title: trophies[index]["title"],
                achieved: achieved,
              );
            } else {

              return GestureDetector(

                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailTrophyPage(trophy: trophies[index]))),
                child: Hero(
                    tag: trophies[index]["title"],
                    child: TrophyCard(
                      image: trophies[index]["images"][0],
                      title: trophies[index]["title"],
                      achieved: achieved,
                    )),
              );
            }
          }),
    );
  }
}
