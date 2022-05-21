import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/agregar_receta.dart';
import 'package:easycook_flutter/ui/screens/perfil.dart';
import 'package:easycook_flutter/ui/screens/perfil_setting.dart';
import 'package:easycook_flutter/ui/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: PerfilSetting(),
                            type: PageTransitionType.fade));
                  },
                  icon: Icon(Icons.settings,
                      color: Color.fromRGBO(27, 125, 255, 1), size: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 275, left: 340),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Register(), type: PageTransitionType.fade));
                  },
                  icon: Icon(Icons.exit_to_app_sharp,
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
                            child: Perfil(), type: PageTransitionType.fade));
                  },
                  child: Text(
                    'Favoritos',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
                Text(
                  'Mis recetas',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(27, 125, 255, 1)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
                padding: const EdgeInsets.only(left: 30, right: 30),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
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
                        Navigator.push(
                            context,
                            PageTransition(
                                child: AgregarReceta(),
                                type: PageTransitionType.fade));
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
