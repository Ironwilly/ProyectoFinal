import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AgregarReceta extends StatefulWidget {
  const AgregarReceta({Key? key}) : super(key: key);

  @override
  State<AgregarReceta> createState() => _AgregarReceta();
}

class _AgregarReceta extends State<AgregarReceta> {
  // donde te lleva o lo que sale al pulsar cada botón del menú inferior
  int _selectedIndex = 3;
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
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 270,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logoEasyCook.jpg'),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 105, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                AutoSizeText(
                  "Agrega una foto ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  maxLines: 1,
                ),
                Icon(
                  Icons.camera_alt_outlined,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  size: 40,
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 1),
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: const SizedBox(
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Agrega los ingredientes',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 30)),
                style: TextStyle(fontSize: 20),
                maxLines: 2,
                minLines: 1,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: const SizedBox(
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Modo de preparación',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 80)),
                style: TextStyle(fontSize: 20),
                maxLines: 4,
                minLines: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 30),
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromRGBO(27, 125, 255, 1),
                  onPrimary: Color.fromRGBO(255, 255, 255, 1),
                  elevation: 5,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
              child: const Text('Guardar', style: TextStyle(fontSize: 25)),
            ),
          ),
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
