import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/global.dart';
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
      "id": 9,
      "name": "Historia",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,
    },
    {
      "id": 10,
      "name": "Arte y literatura",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": "14/12/2001 14:56:10",
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
    {
      "id": 11,
      "name": "Entretenimento",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": "14/12/2001 14:56:10",
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
    {
      "id": 12,
      "name": "Videojuegos",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,
    },
    {
      "id": 13,
      "name": "Geografia",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": "14/12/2001 14:56:10",
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
    {
      "id": 14,
      "name": "Ciencia",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,
    },
    {
      "id": 15,
      "name": "Programación",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": null,
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": null,
      "longitude": null,
    },
    {
      "id": 16,
      "name": "Aleatorio",
      "images": ["assets/images/gopher.webp", "assets/images/gopher2.jpeg"],
      "achieved": 0,
      "dateTime": "14/12/2001 14:56:10",
      "address": "Salesians Sarrià, Barcelona, España",
      "city": "Barcelona",
      "latitude": 41.394209639341035,
      "longitude": 2.1280800907598505,
    },
  ];


  @override
  void initState() {
    loadUsersRelationships();
    super.initState();
  }

  Future<void> loadUsersRelationships() async {
    var userHistoriesids = await getDataApi("user_histories");
    var userTrophies = await getDataApi("user_trophies");

    var ids = getUserHistories(userHistoriesids, currentUser.id!);
    trophies = getUsersTrophies(trophies, userTrophies, ids);

    print(currentUser.id);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadUsersRelationships(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          } else {
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
                title: trophies[index]["name"],
                achieved: achieved,
              );
            } else {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailTrophyPage(trophy: trophies[index]))),
                child: Hero(
                    tag: trophies[index]["name"],
                    child: TrophyCard(
                      image: trophies[index]["images"][0],
                      title: trophies[index]["name"],
                      achieved: achieved,
                    )),
              );
            }
          }),
    );

          }
        });
  }
}

Future getDataApi(String table) async {
  String url = "http://rogercr2001-001-site1.itempurl.com/api/${table}";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    return jsonData;
  }
}

List getUserHistories(dynamic userHistories, int idUser) {
  List idsHistories = [];

  for (var item in userHistories) {
    if (item["id_user"] == idUser) {
      idsHistories.add(item["id_user_histories"]);
    }
  }

  return idsHistories;
}

List getUsersTrophies(List trophies, dynamic userTrophies, List idsHistories) {
  List newTrophies = trophies;

  for (var item in userTrophies) {
    if (idsHistories.contains(item["id_user_histories"])) {
      for (var item2 in newTrophies) {
        if (item2["id"] == item["id_trophy"]) {
          item2["achieved"] = 1;
          item2["dateTime"] = item["date_add"];
          item2["latitude"] = item["latitude"];
          item2["longitude"] = item["longitude"];
        }
      }
    }
  }

  return newTrophies;
}
