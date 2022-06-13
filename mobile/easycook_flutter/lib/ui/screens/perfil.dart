import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/mis_recetas.dart';
import 'package:easycook_flutter/ui/screens/perfil_setting.dart';
import 'package:easycook_flutter/ui/screens/receta_item.dart';
import 'package:easycook_flutter/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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
                            child: RegisterScreen(),
                            type: PageTransitionType.fade));
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
                Text(
                  'Favoritos',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(27, 125, 255, 1)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: MisRecetas(),
                            type: PageTransitionType.fade));
                  },
                  child: Text(
                    'Mis recetas',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
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
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: RecetaItem(),
                                type: PageTransitionType.fade));
                      },
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
                                      image: AssetImage(
                                          'assets/images/stanReco.png'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Stroganoff de pollo fácil',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                      ))),
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
                                'assets/images/tapioca.png',
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
                                      AssetImage('assets/images/kennyReco.png'),
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
                                'Deliciosa pizza de tapioca',
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
                                'assets/images/patatas.png',
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
                                      AssetImage('assets/images/kyleReco.png'),
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
                                'Papas fritas en la freidora de aire',
                                maxLines: 3,
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
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
