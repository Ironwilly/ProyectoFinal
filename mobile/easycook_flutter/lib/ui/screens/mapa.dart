import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
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
    );
  }
}
