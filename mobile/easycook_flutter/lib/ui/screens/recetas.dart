import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/busqueda_receta.dart';
import 'package:easycook_flutter/ui/screens/receta_item.dart';
import 'package:easycook_flutter/ui/screens/usuario_recientes.dart';
import 'package:easycook_flutter/ui/screens/usuarios_lista.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Recetas extends StatefulWidget {
  const Recetas({Key? key}) : super(key: key);

  @override
  State<Recetas> createState() => _RecetasState();
}

class _RecetasState extends State<Recetas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo5.png'),
        leadingWidth: 95,
        title: const Text('Sugerencias'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the sugerencias',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, top: 100),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: BusquedaReceta(),
                                      type: PageTransitionType.fade));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Color.fromRGBO(255, 255, 255, 1),
                                onPrimary: Color.fromRGBO(0, 0, 0, 1),
                                elevation: 5,
                                shadowColor: Color.fromRGBO(0, 0, 0, 1),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    width: 1)),
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
                                MaterialPageRoute(
                                    builder: (context) => BusquedaReceta()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Color.fromRGBO(255, 255, 255, 1),
                                onPrimary: Color.fromRGBO(0, 0, 0, 1),
                                elevation: 5,
                                shadowColor: Color.fromRGBO(0, 0, 0, 1),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    width: 1)),
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
                                MaterialPageRoute(
                                    builder: (context) => UsuariosLista()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Color.fromRGBO(255, 255, 255, 1),
                                onPrimary: Color.fromRGBO(0, 0, 0, 1),
                                elevation: 5,
                                shadowColor: Color.fromRGBO(0, 0, 0, 1),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    width: 1)),
                            child: const Text('Buscar por usuarios',
                                style: TextStyle(fontSize: 25)),
                          ),
                        ),
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(top: 100),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/logoEasyCook.jpg'),
                              fit: BoxFit.contain,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: AutoSizeText(
              "Recetas",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
              maxLines: 1,
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
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Container(
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
                                    margin:
                                        EdgeInsets.only(top: 100, left: 220),
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
                            ),
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
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: RecetaItem(),
                                          type: PageTransitionType.fade));
                                },
                                child: Container(
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
                                      margin:
                                          EdgeInsets.only(top: 110, left: 220),
                                      height: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/kennyReco.png'),
                                          fit: BoxFit.contain,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            ),
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
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: RecetaItem(),
                                          type: PageTransitionType.fade));
                                },
                                child: Container(
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
                                      margin:
                                          EdgeInsets.only(top: 110, left: 220),
                                      height: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/kyleReco.png'),
                                          fit: BoxFit.contain,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            ),
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
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.all(25),
                  elevation: 10,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: RecetaItem(),
                                      type: PageTransitionType.fade));
                            },
                            child: Container(
                                child: Stack(
                              children: [
                                Container(
                                  child: Image.asset(
                                    'assets/images/alcachofas.png',
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
                                          'assets/images/kennyReco.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                )
                              ],
                            )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 18, top: 2, right: 20, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Alcachofas cocidas',
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
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: RecetaItem(),
                                      type: PageTransitionType.fade));
                            },
                            child: Container(
                                child: Stack(
                              children: [
                                Container(
                                  child: Image.asset(
                                    'assets/images/besugo.png',
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
                                          'assets/images/kyleReco.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                )
                              ],
                            )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 18, top: 2, right: 20, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Besugo al horno',
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
                  )),
            ],
          )),
        ],
      ),
    );
  }
}
