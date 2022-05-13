import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  // donde te lleva o lo que sale al pulsar cada botón del menú inferior
  int _selectedIndex = 4;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Inicio',
      style: optionStyle,
    ),
    Text(
      'Index 1: Recetas',
      style: optionStyle,
    ),
    Text(
      'Index 2: Usuarios',
      style: optionStyle,
    ),
    Text(
      'Index 3: Perfil',
      style: optionStyle,
    ),
    Text(
      'Index 4: Mapa',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 270,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logoEasyCook.jpg'),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 15),
            child: AutoSizeText(
              "Mapa ubicación de los usuarios",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
              maxLines: 3,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  elevation: 10,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Stack(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/mapa.png',
                                width: 400,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  )),
            ],
          )),
        ],
      ),

      //menu de navegación inferior

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(0, 0, 0, 1),
              size: 40,
            ),
            label: 'Inicio',
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          ),
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
      ),
    );
  }
}
