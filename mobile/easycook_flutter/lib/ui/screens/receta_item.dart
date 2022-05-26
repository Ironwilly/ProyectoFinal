import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/usuario_recientes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RecetaItem extends StatefulWidget {
  const RecetaItem({Key? key}) : super(key: key);

  @override
  State<RecetaItem> createState() => _RecetaItemState();
}

class _RecetaItemState extends State<RecetaItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 65),
            child: AutoSizeText(
              "Stroganoff de pollo fácil",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
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
                      ],
                    )),
                  ],
                ),
              )),
          Expanded(
              child: ListView(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Text(
                        'Ingredientes:',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '-- 500 gramos de bistec de lomo, cortado en tiras '
                        '-- 1/4 taza (té) de mantequilla '
                        '-- 1 pieza de cebolla picada '
                        '-- 1 cucharada de mostaza (postre) '
                        '-- 1 cucharada de ketchup (o kétchup) '
                        '-- 1 pizca de pimienta negra '
                        '-- 1 pieza de tomate sin piel picado '
                        '-- 1 taza (té) de champiñones variados | surtido escurrido '
                        '-- 1 lata de crema agria '
                        '-- sal a gusto ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Modo de preparación:',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Derrita la mantequilla y saltee la cebolla hasta que esté transparente. Agregar la carne y sazonar con sal. Revuelva hasta que la carne se dore por todos lados. Agregue mostaza, ketchup, pimienta negra. Derrita la mantequilla y saltee la cebolla hasta que esté transparente. Agregar la carne y sazonar con sal. Revuelva hasta que la carne se dore por todos lados. Derrita la mantequilla y saltee la cebolla hasta que esté transparente. Agregar la carne y sazonar con sal. Revuelva hasta que la carne se dore por todos lados. ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Card(
                          margin: EdgeInsets.all(15),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(27, 125, 255, 1))),
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
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: UsuarioReciente(),
                                              type: PageTransitionType.fade));
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/stan.png'),
                                              fit: BoxFit.none),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 1.0,
                                                color: Colors.black)
                                          ]),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('Stan Marsh',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Text('100+ recetas'),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
