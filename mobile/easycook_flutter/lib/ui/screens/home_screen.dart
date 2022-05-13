import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/busqueda_receta.dart';
import 'package:easycook_flutter/ui/screens/mapa.dart';
import 'package:easycook_flutter/ui/screens/perfil.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:easycook_flutter/ui/screens/usuarios_lista.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            margin: EdgeInsets.only(left: 5, right: 5),
            child: AutoSizeText(
              "¿Qué vamos a comer hoy ?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50.0),
              maxLines: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusquedaReceta()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromRGBO(255, 255, 255, 1),
                  onPrimary: Color.fromRGBO(0, 0, 0, 1),
                  elevation: 5,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
              child: const Text(
                'Buscar por recetas',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusquedaReceta()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromRGBO(255, 255, 255, 1),
                  onPrimary: Color.fromRGBO(0, 0, 0, 1),
                  elevation: 5,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
              child: const Text('Buscar por ingredientes',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsuariosLista()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromRGBO(255, 255, 255, 1),
                  onPrimary: Color.fromRGBO(0, 0, 0, 1),
                  elevation: 5,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
              child: const Text('Buscar por usuarios',
                  style: TextStyle(fontSize: 25)),
            ),
          ),
        ],
      ),
    );
  }
}
