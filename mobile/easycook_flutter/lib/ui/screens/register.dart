import 'package:easycook_flutter/ui/screens/home_screen.dart';
import 'package:easycook_flutter/ui/screens/login.dart';
import 'package:easycook_flutter/ui/screens/menu.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondoUserYRegister.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'EasyCook',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1)),
                textAlign: TextAlign.center,
              )),
          Container(
              margin: const EdgeInsets.only(top: 0, bottom: 20),
              child: const Text(
                'Registrate para ver las recetas.',
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                textAlign: TextAlign.center,
              )),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
            height: 498,
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              child: ListView(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 40,
                      margin: const EdgeInsets.only(top: 20),
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                              Text(
                                'Avatar   ',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.account_circle_outlined,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                size: 30,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('                      Imagen/Fondo',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1)))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 15),
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
                                builder: (context) => const Menu()),
                          );
                        },
                        child: const Text('Registrar'),
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '¿Tienes cuenta ya?',
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                'Logueate Aquí',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
