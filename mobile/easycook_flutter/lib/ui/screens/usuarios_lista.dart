import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/usuario_recientes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UsuariosLista extends StatefulWidget {
  const UsuariosLista({Key? key}) : super(key: key);

  @override
  State<UsuariosLista> createState() => _UsuariosListaState();
}

class _UsuariosListaState extends State<UsuariosLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logoEasyCook.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: AutoSizeText(
              "Usuarios",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 60.0),
              maxLines: 1,
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: UsuarioReciente(),
                              type: PageTransitionType.fade));
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/stan.png'),
                                    fit: BoxFit.none),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0, color: Colors.black)
                                ]),
                          ),
                        ),
                        Column(
                          children: [
                            Text('Stan Marsh',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            Text('100+ recetas'),
                          ],
                        ),
                      ],
                    ),
                  )),
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
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/kyle.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 1.0, color: Colors.black)
                              ]),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text('Kyle Broflovski',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text('37 recetas'),
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
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/kenny.png'),
                                  fit: BoxFit.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 1.0, color: Colors.black)
                              ]),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text('Kenny McCormick',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text('74 recetas'),
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
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/garrison.png'),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 1.0, color: Colors.black)
                              ]),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text('Herbert Garrison',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text('55 recetas'),
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
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/chef.png'),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 1.0, color: Colors.black)
                              ]),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text('Jerome Chef',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text('200+ recetas'),
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
