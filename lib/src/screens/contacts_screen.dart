import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/global.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List contacts = [];

  @override
  void initState() {
    loadUsersRelationships();
    super.initState();
  }

  Future<void> loadUsersRelationships() async {
    var users = await getDataApi("users");
    var relationships = await getDataApi("relationships");

    var relationsUser = getUsersRelations(relationships, currentUser.id!);
    contacts = getUsersFriendsData(users, relationsUser);

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
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [contenido(context, contacts)],
                  ),
                ),
              ),
            );
          }
        });
  }
}

Widget contenido(BuildContext context, List contacts) {
  return Column(children: [
    SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: Image.asset(
                      'assets/images/trevor-pic.webp',
                      // contacts[index]["user_image"],
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                        "${contacts[index]['firstname']} ${contacts[index]['lastname']}"),
                    subtitle: Text('@${contacts[index]["alias"]}'),
                  )
                ]));
          },
        )),
  ]);
}

Future getDataApi(String table) async {
  String url = "http://rogercr2001-001-site1.itempurl.com/api/${table}";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    return jsonData;
  }
}

List getUsersRelations(dynamic relations, int currentIdUser) {
  List ids = [];

  for (var item in relations) {
    int idSend = item["id_user_send"];
    int idReceived = item["id_user_received"];

    if (idSend == currentIdUser || idReceived == currentIdUser) {
      ids.add(idReceived);
      ids.add(idSend);
    }
  }

  return ids;
}

List getUsersFriendsData(dynamic users, List friendsId) {

  List distinctIds = friendsId.toSet().toList();
  List usersData = [];

  for (var item in users) {
    int idUser = item["id_user"];

    if (distinctIds.contains(idUser) && idUser!= currentUser.id) {
      String firstname = item["firstname"];
      String lastname = item["lastname"];
      String alias = item["alias"];
      String userImage = item["user_image"];

      Map user = {
        "firstname": firstname,
        "lastname": lastname,
        "alias": alias,
        "user_image": userImage,
      };

      usersData.add(user);
    }
  }

  return usersData;
}
