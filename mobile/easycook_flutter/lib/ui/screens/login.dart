import 'package:easycook_flutter/ui/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'menu.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              margin: const EdgeInsets.only(top: 60),
              child: const Text(
                'EasyCook',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1)),
                textAlign: TextAlign.center,
              )),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: const Text(
                'Logueate para acceder a tu cuenta',
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                textAlign: TextAlign.center,
              )),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
            height: 398,
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
                      margin: const EdgeInsets.only(top: 60),
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
                      margin: const EdgeInsets.only(top: 80),
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
                      margin: EdgeInsets.only(top: 100, bottom: 15),
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: Color.fromRGBO(27, 125, 255, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Menu(),
                                  type: PageTransitionType.fade));
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
