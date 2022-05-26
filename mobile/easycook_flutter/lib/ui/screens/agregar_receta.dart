import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AgregarReceta extends StatefulWidget {
  const AgregarReceta({Key? key}) : super(key: key);

  @override
  State<AgregarReceta> createState() => _AgregarReceta();
}

class _AgregarReceta extends State<AgregarReceta> {
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
                  Icons.add_a_photo,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
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
    );
  }
}
