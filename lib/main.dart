import 'package:epicesindiennes/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importer flutter_svg

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Liste des pages
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
    Center(child: Text('Page 4')),
    Center(child: Text('Page 5')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Fond de couleur #EEEEEE
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),  // Radius au-dessus à gauche
            topRight: Radius.circular(16), // Radius au-dessus à droite
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top : 16.0),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg', // Chemin de l'icône SVG
                  color: _selectedIndex == 0 ? Color(0xFFFF9800) : Color(0xFF263238),
                ),
                label: '', // Supprimer le label
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/epices.svg', // Chemin de l'icône SVG
                  color: _selectedIndex == 1 ? Color(0xFFFF9800) : Color(0xFF263238),
                ),
                label: '', // Supprimer le label
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/recettes.svg', // Chemin de l'icône SVG
                  color: _selectedIndex == 2 ? Color(0xFFFF9800) : Color(0xFF263238),
                ),
                label: '', // Supprimer le label
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/quiz.svg', // Chemin de l'icône SVG
                  color: _selectedIndex == 3 ? Color(0xFFFF9800) : Color(0xFF263238),
                ),
                label: '', // Supprimer le label
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg', // Chemin de l'icône SVG
                  color: _selectedIndex == 4 ? Color(0xFFFF9800) : Color(0xFF263238),
                ),
                label: '', // Supprimer le label
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
