import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/perfil_setting.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EditarReceta extends StatefulWidget {
  const EditarReceta({Key? key}) : super(key: key);

  @override
  State<EditarReceta> createState() => _EditarRecetaState();
}

class _EditarRecetaState extends State<EditarReceta> {
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
                margin: EdgeInsets.only(top: 275, left: 340),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: PerfilSetting(),
                            type: PageTransitionType.fade));
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      color: Color.fromRGBO(27, 125, 255, 1), size: 25),
                ),
              ),
            ],
          ),
          Container(
            height: 450,
            child: ListView(
                padding: const EdgeInsets.only(left: 30, right: 30),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 30, top: 20, bottom: 10),
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
                          Icons.camera_alt_outlined,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 1, right: 1, top: 20, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: const SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Nombre de la receta a editar',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 10)),
                        style: TextStyle(fontSize: 20),
                        maxLines: 2,
                        minLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 1, right: 1, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: const SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Agrega los ingredientes',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(fontSize: 20),
                        maxLines: 10,
                        minLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 1, right: 1),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: const SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Modo de preparación',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(fontSize: 20),
                        maxLines: 6,
                        minLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, right: 25, top: 2, bottom: 20),
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: PerfilSetting(),
                                type: PageTransitionType.fade));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Color.fromRGBO(27, 125, 255, 1),
                          onPrimary: Color.fromRGBO(255, 255, 255, 1),
                          elevation: 5,
                          shadowColor: Color.fromRGBO(0, 0, 0, 1),
                          side: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
                      child:
                          const Text('Guardar', style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
