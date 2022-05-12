import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EditarReceta extends StatefulWidget {
  const EditarReceta({Key? key}) : super(key: key);

  @override
  State<EditarReceta> createState() => _EditarRecetaState();
}

class _EditarRecetaState extends State<EditarReceta> {
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
                    margin: const EdgeInsets.only(
                        left: 5, right: 30, top: 20, bottom: 10),
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
                    margin: const EdgeInsets.only(
                        left: 1, right: 1, top: 10, bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: const SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Agrega los ingredientes',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 50)),
                        style: TextStyle(fontSize: 20),
                        maxLines: 2,
                        minLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 1, right: 1),
                    width: MediaQuery.of(context).size.width,
                    height: 230,
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
                    margin: EdgeInsets.only(
                        left: 25, right: 25, top: 2, bottom: 20),
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
                      child:
                          const Text('Guardar', style: TextStyle(fontSize: 25)),
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
