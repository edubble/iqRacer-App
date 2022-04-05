import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iq_racer/src/widgets/profile_menu.dart';
import 'package:iq_racer/src/widgets/profile_pic.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Icon icon = Icon(Icons.arrow_forward_ios);
  bool _value = false;

  String? selectedItem = 'Principiante';
  List<String> levels = [
    'Principiante',
    'Moderado',
    'Avanzado',
    'Experto',
  ];

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          UserProfileOption(
            text: "Tema",
            icon: Icons.brightness_2,
            press: () => {},
            rightIcon: _darkModeColor(),
          ),
          UserProfileOption(
            text: "Dificultad",
            icon: Icons.lightbulb,
            press: () {},
            rightIcon: _dropDownLevels(),
          ),
          UserProfileOption(
            text: "Cambiar contraseña",
            icon: Icons.password_rounded,
            press: () {},
            rightIcon: icon,
          ),
        ],
      ),
    );
  }

  _darkModeColor() {
    return Switch(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
          value = !value;
        });
      },
      activeColor: const Color(0xffFC5200),
      activeTrackColor: const Color(0xffFC5200),
      inactiveThumbColor: Colors.black,
      dragStartBehavior: DragStartBehavior.start,
    );
  }

  _dropDownLevels() {
    return DropdownButton<String>(
      iconEnabledColor: const Color(0xffFC5200),
        value: selectedItem,
        items: levels
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 15)),
                ))
            .toList(),
        onChanged: (item) => setState(() => selectedItem = item));
  }
}
