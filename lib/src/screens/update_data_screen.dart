import 'package:flutter/material.dart';
import 'package:iq_racer/src/screens/menuprincipal_screen.dart';

class UpdateDataScreen extends StatefulWidget {
  const UpdateDataScreen({Key? key, required this.fieldValue})
      : super(key: key);

  final String fieldValue;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<UpdateDataScreen> {
  TextEditingController controlador = TextEditingController();

  @override
  void initState() {
    controlador.text = widget.fieldValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarStyle(),
        titleSpacing: 6,
        elevation: 6,
        backgroundColor: const Color(0xffFC5200),
        centerTitle: true,
        leadingWidth: 80,
        title: const Text(
          "Usuario",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              print(controlador.text);
            },
            child: const Text(
              'Listo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [nombreUsuario(context, controlador)],
          ),
        ),
      ),
    );
  }
}

@override
Widget nombreUsuario(BuildContext context, TextEditingController controlador) {
  return TextField(
    controller: controlador,
    decoration: const InputDecoration(
      border:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFC5200))),
      helperText:
          'Puedes elegir un nombre de usuario en IqRacer.\nSi lo haces, las personas te podrán encontrar por ese \nnombre y contactarte sin saber tu número de teléfono. \n\nPuedes usar a-z, 0-9 y guiones bajos.\n\nLa longitud mínima es de 5 caracteres.',
      // labelText: 'Usuario: ',
      prefixText: 'Usuario: ',
    ),
  );
}
