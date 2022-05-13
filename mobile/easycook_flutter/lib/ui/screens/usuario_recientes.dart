import 'package:easycook_flutter/ui/screens/usuario_categorias.dart';
import 'package:flutter/material.dart';

class UsuarioReciente extends StatefulWidget {
  const UsuarioReciente({Key? key}) : super(key: key);

  @override
  State<UsuarioReciente> createState() => _UsuarioRecienteState();
}

class _UsuarioRecienteState extends State<UsuarioReciente> {
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
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Recientes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsuarioCategorias()),
                      );
                      style:
                      TextButton.styleFrom(
                          primary: Colors.purpleAccent,
                          backgroundColor: Color.fromARGB(255, 72, 254, 0));
                    },
                    child: const Text(
                      'Categorías',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.all(25),
                  elevation: 10,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Stack(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/Stroganoff.png',
                                width: 400,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 110, left: 220),
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/stanReco.png'),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        )),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 18, top: 2, right: 20, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Stroganoff de pollo fácil',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(27, 125, 255, 1),
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.all(25),
                  elevation: 10,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Stack(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/lasana.png',
                                width: 400,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 110, left: 220),
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/stanReco.png'),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        )),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 18, top: 2, right: 20, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Lasanha deliciosa',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(27, 125, 255, 1),
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
        ],
      ),
    );
  }
}
