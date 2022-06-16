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
import 'package:easycook_flutter/ui/screens/receta_item.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:easycook_flutter/ui/screens/register_screen.dart';
import 'package:easycook_flutter/ui/screens/usuario_categorias.dart';
import 'package:easycook_flutter/ui/screens/usuario_recientes.dart';
import 'package:easycook_flutter/utils/preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  PreferenceUtils.init();
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
      initialRoute: '/misRecetasLista',
      routes: {
        '/': (context) => const RegisterScreen(),
        '/editarReceta': (context) => const EditarReceta(),
        '/recetaItem': (context) => const RecetaItem(),
        '/menu': (context) => const Menu(),
        '/mapa': (context) => const Mapa(),
        '/busquedaReceta': (context) => const BusquedaReceta(),
        '/usuarioReciente': (context) => const UsuarioReciente(),
        '/otros': (context) => const Otros(),
        '/dulces': (context) => const Dulces(),
        '/pastas': (context) => const Pastas(),
        '/homeScreen': (context) => const HomeScreen(),
        '/login': (context) => const Login(),
        '/perfil': (context) => const Perfil(),
        '/register': (context) => const RegisterScreen(),
        '/perfilSetting': (context) => const PerfilSetting(),
        '/editarPerfil': (context) => const EditarPerfil(),
        '/misRecetas': (context) => const MisRecetas(),
        '/recetas': (context) => const Recetas(),
        '/agregarReceta': (context) => const AgregarReceta(),
        '/usuarioCategorias': (context) => const UsuarioCategorias(),
      },
    );
  }
}
