import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/profile_screen.dart';
import 'package:iq_racer/src/widgets/sidebar_menu.dart';

var name;
var email;

void GuardarUsuaris(correu, nom) {
  email = correu;
  name = nom;
  var registres = [correu, nom];
}

// class MenuPrincipal extends StatefulWidget {
//   @override
//   _MenuPrincipalState createState() => _MenuPrincipalState();
// }
class MenuPrincipal extends StatelessWidget {
  final List options;

  const MenuPrincipal({Key? key, required this.options}) : super(key: key);
  

  @override
  Widget build(BuildContext context) => Scaffold(
        // drawer: Menu_lateral(user),
        body: Container(
          margin: const EdgeInsets.only(top: 60.0),
          // color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          child: optionsGridView(context, options),
        ),
      );
}

Widget appBarStyle() {
  return Container(
    decoration: const BoxDecoration(
        
        color: Color(0xffF5591F),
        gradient: LinearGradient(
          colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
  );
}

Widget optionContainer(List data, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(
        data[index]["image"],
        width: 100,
        height: 100,
      ),
      Text(
        data[index]["title"].toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    ],
  );
}

Widget optionButton(BuildContext context, List data, int index) {
  return InkWell(
      onTap: () {
        print("onTap!");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => data[index]["page"],
        ));
      },
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffF2E1E1)),
        child: optionContainer(data, index),
      ));
}

Widget optionsGridView(BuildContext context, List data) {
  return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10, mainAxisSpacing: 10, maxCrossAxisExtent: 200),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      itemBuilder: (context, index) {
        return optionButton(context, data, index);
      });
}
