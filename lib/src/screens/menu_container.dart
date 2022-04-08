import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq_racer/src/controllers/question_controller.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/models/category.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/categories_screen.dart';
import 'package:iq_racer/src/screens/contacts_screen.dart';
import 'package:iq_racer/src/screens/profile_screen.dart';
import 'package:iq_racer/src/screens/scan_screen_widget.dart';
import 'package:iq_racer/src/screens/settings_screen.dart';
import 'package:iq_racer/src/screens/trophies_screen.dart';
import 'package:iq_racer/src/widgets/sidebar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.categories})
      : super(key: key);

  final List<Category> categories;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  static final List<String> _titles = [
    "Categorias",
    "Perfil",
    "Trofeos",
    "QR",
    "Ajustes",
    "Amigos"
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Categories(categories: widget.categories),
      ProfilePage(),
      const TrophiesPage(),
      const QRScreen(),
      SettingsPage(),
      const ContactsScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedPageIndex]),
        centerTitle: true,
        toolbarHeight: 60,
        flexibleSpace: appBarStyle(),
      ),
      drawer: SideBarMenu(
          user: currentUser,
          selectedPageIndex: _selectedPageIndex,
          onIconTap: _onIconTapped),
      body: Container(child: _pages[_selectedPageIndex]),
    );
  }
}
