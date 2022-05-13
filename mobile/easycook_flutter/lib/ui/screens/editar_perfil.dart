import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/ui/screens/perfil_setting.dart';
import 'package:flutter/material.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
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
                    width: 300,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nombre',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Apellidos',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Usuario',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Ciudad/Pueblo',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Contraseña',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Confirmar contraseña',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('Avatar   '),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              size: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                                '                                             Imagen/Fondo')
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, right: 25, top: 30, bottom: 15),
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        elevation: 5,
                        primary: Color.fromRGBO(27, 125, 255, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PerfilSetting()),
                        );
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
