import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MisRecetas extends StatefulWidget {
  const MisRecetas({Key? key}) : super(key: key);

  @override
  State<MisRecetas> createState() => _MisRecetasState();
}

class _MisRecetasState extends State<MisRecetas> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/fondoCartman.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 220, right: 220),
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cartman.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 275, left: 150),
                  child: Text(
                    'Eric Cartman',
                    style: TextStyle(fontSize: 17),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 295, left: 150),
                  child: Text('0 recetas', style: TextStyle(fontSize: 15))),
              Container(
                margin: EdgeInsets.only(top: 275, left: 310),
                child: Icon(
                  Icons.settings,
                  color: Color.fromRGBO(27, 125, 255, 1),
                  size: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 275, left: 340),
                child: Icon(
                  Icons.exit_to_app_sharp,
                  color: Color.fromRGBO(27, 125, 255, 1),
                  size: 25,
                ),
              ),
            ],
          ),
          Container(
            height: 398,
            child: ListView(
                padding: const EdgeInsets.only(left: 30, right: 30),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 100, bottom: 30),
                      child: AutoSizeText(
                        '               UPS...'
                        '                      Parece que aún no has '
                        'publicado una receta. ',
                        style: TextStyle(fontSize: 30),
                        maxLines: 3,
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        left: 130, right: 130, top: 2, bottom: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      backgroundColor: Color.fromRGBO(27, 125, 255, 1),
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ),
                ]),
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
