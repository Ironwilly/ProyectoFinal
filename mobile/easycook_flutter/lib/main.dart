import 'package:easycook_flutter/ui/screens/agregar_receta.dart';
import 'package:easycook_flutter/ui/screens/busqueda_receta.dart';
import 'package:easycook_flutter/ui/screens/dulces.dart';
import 'package:easycook_flutter/ui/screens/editar_perfil.dart';
import 'package:easycook_flutter/ui/screens/editar_receta.dart';
import 'package:easycook_flutter/ui/screens/home_screen.dart';
import 'package:easycook_flutter/ui/screens/login.dart';
import 'package:easycook_flutter/ui/screens/mapa.dart';
import 'package:easycook_flutter/ui/screens/menu.dart';
import 'package:easycook_flutter/ui/screens/mis_recetas.dart';
import 'package:easycook_flutter/ui/screens/otros.dart';
import 'package:easycook_flutter/ui/screens/pastas.dart';
import 'package:easycook_flutter/ui/screens/perfil.dart';
import 'package:easycook_flutter/ui/screens/perfil_setting.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:easycook_flutter/ui/screens/register.dart';
import 'package:easycook_flutter/ui/screens/usuario_categorias.dart';
import 'package:easycook_flutter/ui/screens/usuario_recientes.dart';
import 'package:easycook_flutter/ui/screens/usuarios_lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyCook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyCook',
      initialRoute: '/',
      routes: {
        '/': (context) => const Register(),
        '/EditarReceta': (context) => const EditarReceta(),
        '/Menu': (context) => const Menu(),
        '/Mapa': (context) => const Mapa(),
        '/BusquedaReceta': (context) => const BusquedaReceta(),
        '/UsuarioReciente': (context) => const UsuarioReciente(),
        '/Otros': (context) => const Otros(),
        '/Dulces': (context) => const Dulces(),
        '/Pastas': (context) => const Pastas(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/Login': (context) => const Login(),
        '/Perfil': (context) => const Perfil(),
        '/Register': (context) => const Register(),
        '/PerfilSetting': (context) => const PerfilSetting(),
        '/EditarPerfil': (context) => const EditarPerfil(),
        '/MisRecetas': (context) => const MisRecetas(),
        '/Recetas': (context) => const Recetas(),
        '/AgregarReceta': (context) => const AgregarReceta(),
        '/UsuarioCategorias': (context) => const UsuarioCategorias(),
      },
    );
  }
}
