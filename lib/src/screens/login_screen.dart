import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/screens/menu_container.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:iq_racer/src/screens/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  var name;
  var email;
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  signIn(String email, pass) async {
    bool isCorrect = false;
    const url = "http://rogercr2001-001-site1.itempurl.com/api/users";
    final response = await http.get(Uri.parse(url));
    User user;
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        if (item["email"] == email && item["password"] == pass) {
          isCorrect = true;
          currentUser = User(
            item["id_user"],
            item["firstname"],
            item["lastname"],
            item["email"],
            item["password"],
            item["register_date"],
            item["id_gender"],
            item["first_time"],
            "user_" + item["id_user"].toString(),
            "trevor-pic.webp",
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => WelcomeScreen(
                      user: currentUser,
                    )),
            (route) => false,
          );

          break;
        }
      }
      if (!isCorrect) {
        _showDoneSnackBar(0xFFcc0000);
      }
    }
    return isCorrect;
  }

  _showDoneSnackBar(int myColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Incorrect email or password"),
        backgroundColor: Color(myColor),
        duration: const Duration(milliseconds: 1000)));
  }

  Widget initWidget() {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: Color(0xffF5591F),
              gradient: LinearGradient(
                colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  backgroundColor: Colors.white,
                  radius: 100,
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 90),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  // controller: _controller, // afegim un controlador
                  onSubmitted: (what) {
                    Navigator.of(context).pop(what);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                alignment: Alignment.center,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Contraseña",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  // controller: _controller, // afegim un controlador
                  onSubmitted: (what) {
                    Navigator.of(context).pop(what);
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, right: 20),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: const Text(
              "¿Has olvidado la contraseña?",
              style: TextStyle(color: Color(0xffF5591F)),
            ),
            onTap: () => {},
          ),
        ),
        GestureDetector(
          onTap: () => {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Menu_lateral()))
            // /*Write your own click code*/
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                var isCorrect =
                    signIn(emailController.text, passwordController.text);
                if (isCorrect == true) {}
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xffF5591F), (Color(0xffF2861E))],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 0,
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Container(
                  width: 300,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    'INICIAR SESIÓN',
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text("¿No tienes cuenta?"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Registrarse",
                  style: TextStyle(color: Color(0xffF5591F)),
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}
