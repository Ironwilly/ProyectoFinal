import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MisRecetas extends StatefulWidget {
  const MisRecetas({Key? key}) : super(key: key);

  @override
  State<MisRecetas> createState() => _MisRecetasState();
}

class _MisRecetasState extends State<MisRecetas> {
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
    );
  }
}
