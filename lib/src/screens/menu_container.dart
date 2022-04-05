import 'package:flutter/material.dart';
import 'package:iq_racer/src/models/user.dart';
import 'package:iq_racer/src/screens/categories_screen.dart';
import 'package:iq_racer/src/screens/menuprincipal_screen.dart';
import 'package:iq_racer/src/screens/profile_screen.dart';
import 'package:iq_racer/src/screens/scan_screen_widget.dart';
import 'package:iq_racer/src/screens/settings_screen.dart';
import 'package:iq_racer/src/screens/trophies_screen.dart';
import 'package:iq_racer/src/widgets/sidebar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  static final List<String> _titles = [
    "Perfil",
    "Categorias",
    "Trofeos",
    "QR",
    "Ajustes",
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ProfilePage(user: widget.user),
      const Categories(),
      const TrophiesPage(),
      QRScreen(user: widget.user),
      SettingsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedPageIndex]),
        centerTitle: true,
        toolbarHeight: 60,
        flexibleSpace: appBarStyle(),
      ),
      drawer: SideBarMenu(
          user: widget.user,
          selectedPageIndex: _selectedPageIndex,
          onIconTap: _onIconTapped),
      body: Container(child: _pages[_selectedPageIndex]),
    );
  }
}
