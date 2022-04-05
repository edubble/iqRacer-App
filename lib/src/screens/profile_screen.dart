import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/update_data_screen.dart';
import 'package:iq_racer/src/widgets/profile_menu.dart';
import 'package:iq_racer/src/widgets/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  final User user;
  final Icon icon = const Icon(Icons.arrow_forward_ios);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(profilePic: user.userImage!),
          const SizedBox(height: 20),
          UserProfileOption(
            text: user.firstname + " " + user.lastname,
            icon: Icons.person,
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UpdateDataScreen(fieldValue: user.firstname + " " + user.lastname,),
              ))
            },
            rightIcon: icon,
          ),
          UserProfileOption(
            text: user.email,
            icon: Icons.email,
            press: () {},
            rightIcon: icon,
          ),
          UserProfileOption(
            text: "@" + user.userName,
            icon: Icons.sentiment_satisfied_rounded,
            press: () {},
            rightIcon: icon,
          ),
          UserProfileOption(
            text: "3 / 9",
            icon: Icons.emoji_events,
            press: () {},
            rightIcon: icon,
          ),
          _logOutButton(context, "Cerrar Sesión")
        ],
      ),
    );
  }
}

_logOutButton(BuildContext context, String text) {
  return GestureDetector(
    onTap: () {
      print("Session closed");
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF5591F),
            gradient: const LinearGradient(
              colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        )),
      ),
    ),
  );
}
