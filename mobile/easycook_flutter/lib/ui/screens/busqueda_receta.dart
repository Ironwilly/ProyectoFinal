import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BusquedaReceta extends StatefulWidget {
  const BusquedaReceta({Key? key}) : super(key: key);

  @override
  State<BusquedaReceta> createState() => _BusquedaRecetaState();
}

class _BusquedaRecetaState extends State<BusquedaReceta> {
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
              "Resultados de la búqueda",
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
                                'assets/images/ensalada.png',
                                width: 400,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 110, left: 220),
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/garrisonReco.png'),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Ensalada de macarrones',
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
