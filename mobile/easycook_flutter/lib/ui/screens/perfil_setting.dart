import 'package:easycook_flutter/ui/screens/editar_perfil.dart';
import 'package:easycook_flutter/ui/screens/editar_receta.dart';
import 'package:easycook_flutter/ui/screens/perfil.dart';
import 'package:flutter/material.dart';

class PerfilSetting extends StatefulWidget {
  const PerfilSetting({Key? key}) : super(key: key);

  @override
  State<PerfilSetting> createState() => _PerfilSettingState();
}

class _PerfilSettingState extends State<PerfilSetting> {
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
                margin: EdgeInsets.only(top: 264, left: 340),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Perfil()),
                    );
                  },
                  icon: Icon(Icons.exit_to_app_sharp,
                      color: Color.fromRGBO(27, 125, 255, 1), size: 25),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 100),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditarPerfil()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromRGBO(27, 125, 255, 1),
                  onPrimary: Color.fromRGBO(0, 0, 0, 1),
                  elevation: 5,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
              child: const Text(
                'Editar perfil',
                style: TextStyle(
                    fontSize: 25, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 70),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditarReceta()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromRGBO(27, 125, 255, 1),
                  onPrimary: Color.fromRGBO(0, 0, 0, 1),
                  elevation: 5,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1)),
              child: const Text(
                'Editar receta por nombre',
                style: TextStyle(
                    fontSize: 25, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
