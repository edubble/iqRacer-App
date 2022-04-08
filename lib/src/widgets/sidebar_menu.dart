import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/user.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({
    Key? key,
    required this.user,
    required this.selectedPageIndex,
    required this.onIconTap,
  }) : super(key: key);
  final User user;
  final int selectedPageIndex;
  final Function onIconTap;
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 20);
    final firstName = user.firstname;
    final userName = user.userName;
    final profilePic = "assets/images/${user.userImage}";

    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 214, 210, 207),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),
              color: Color(0xffF5591F),
              gradient: LinearGradient(
                colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: ListView(
            children: <Widget>[
              buildHeader(
                  urlImage: profilePic,
                  name: firstName,
                  email: "@" + userName,
                  index: 1,
                  secondIndex: 3,
                  context: context),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    // buildSearchField(),

                    const SizedBox(height: 24),
                    buildMenuItem('Preguntas', Icons.quiz, 0, context),

                    const SizedBox(height: 24),
                    buildMenuItem('Trofeos', Icons.emoji_events, 2, context),

                    const SizedBox(height: 24),
                    buildMenuItem('Amigos', Icons.contacts_rounded, 5, context),

                    const SizedBox(height: 24),
                    buildMenuItem('Ajustes', Icons.settings, 4, context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(
          {required String urlImage,
          required String name,
          required String email,
          required int index,
          required int secondIndex,
          required BuildContext context}) =>
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
          onIconTap(index);
        },
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                // backgroundImage: NetworkImage(urlImage),
                backgroundImage: AssetImage(urlImage),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    onIconTap(secondIndex);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(Icons.qr_code, color: Colors.orange[900]),
                  ))
            ],
          ),
        ),
      );

  Widget buildMenuItem(
      String text, IconData icon, int index, BuildContext context) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () => {Navigator.of(context).pop(), onIconTap(index)},
    );
  }
}
