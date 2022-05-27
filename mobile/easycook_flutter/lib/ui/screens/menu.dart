import 'package:easycook_flutter/ui/screens/home_screen.dart';
import 'package:easycook_flutter/ui/screens/mapa.dart';
import 'package:easycook_flutter/ui/screens/perfil.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:easycook_flutter/ui/screens/usuarios_lista.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // donde te lleva o lo que sale al pulsar cada botón del menú inferior
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Recetas(),
    UsuariosLista(),
    Perfil(),
    Mapa(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        //menu de navegación inferior

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank_outlined,
                color: Color.fromRGBO(0, 0, 0, 1),
                size: 40,
              ),
              label: 'Recetas',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_rounded,
                color: Color.fromRGBO(0, 0, 0, 1),
                size: 40,
              ),
              label: 'Usuarios',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(0, 0, 0, 1),
                size: 40,
              ),
              label: 'Perfil',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                color: Color.fromRGBO(0, 0, 0, 1),
                size: 40,
              ),
              label: 'Mapa',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(252, 0, 0, 1),
          onTap: _onItemTapped,
        ));
  }
}
