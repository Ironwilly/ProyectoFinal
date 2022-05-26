import 'package:easycook_flutter/ui/screens/dulces.dart';
import 'package:easycook_flutter/ui/screens/menu.dart';
import 'package:easycook_flutter/ui/screens/otros.dart';
import 'package:easycook_flutter/ui/screens/pastas.dart';
import 'package:easycook_flutter/ui/screens/perfil_setting.dart';
import 'package:easycook_flutter/ui/screens/usuario_recientes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UsuarioCategorias extends StatefulWidget {
  const UsuarioCategorias({Key? key}) : super(key: key);

  @override
  State<UsuarioCategorias> createState() => _UsuarioCategoriasState();
}

class _UsuarioCategoriasState extends State<UsuarioCategorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: AssetImage('assets/images/fondoStan.png'),
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
                    image: AssetImage('assets/images/stanReco.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 275, left: 150),
                  child: Text(
                    'Stan Marsh',
                    style: TextStyle(fontSize: 17),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 295, left: 150),
                  child: Text('100+ recetas', style: TextStyle(fontSize: 15))),
              Container(
                margin: EdgeInsets.only(top: 275, left: 310),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Menu(), type: PageTransitionType.fade));
                  },
                  icon: Icon(Icons.menu,
                      color: Color.fromRGBO(27, 125, 255, 1), size: 25),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: UsuarioReciente(),
                            type: PageTransitionType.fade));
                  },
                  child: Text(
                    'Recientes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Categorías',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(15),
                color: Color.fromRGBO(255, 255, 255, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(
                        width: 2, color: Color.fromRGBO(27, 125, 255, 1))),
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 100.0,
                          height: 70.0,
                          child: Column(
                            children: [
                              Text('Pastas',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('42 recetas',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 15),
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              elevation: 5,
                              primary: Color.fromRGBO(27, 125, 255, 1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Pastas(),
                                      type: PageTransitionType.fade));
                            },
                            child: const Text('Ver'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(15),
                color: Color.fromRGBO(255, 255, 255, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(
                        width: 2, color: Color.fromRGBO(27, 125, 255, 1))),
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 100.0,
                          height: 70.0,
                          child: Column(
                            children: [
                              Text('Dulces',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('56 recetas',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 15),
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              elevation: 5,
                              primary: Color.fromRGBO(27, 125, 255, 1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Dulces(),
                                      type: PageTransitionType.fade));
                            },
                            child: const Text('Ver'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(15),
                color: Color.fromRGBO(255, 255, 255, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(
                        width: 2, color: Color.fromRGBO(27, 125, 255, 1))),
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 100.0,
                          height: 70.0,
                          child: Column(
                            children: [
                              Text('Otros',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('23 recetas',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 15),
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              elevation: 5,
                              primary: Color.fromRGBO(27, 125, 255, 1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Otros(),
                                      type: PageTransitionType.fade));
                            },
                            child: const Text('Ver'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
