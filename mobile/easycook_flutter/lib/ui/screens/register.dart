import 'dart:io';

import 'package:easycook_flutter/bloc/image_bloc/bloc/image_bloc.dart';
import 'package:easycook_flutter/bloc/register/bloc/register_bloc.dart';
import 'package:easycook_flutter/models/register_dto.dart';
import 'package:easycook_flutter/models/register_response.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository_imp.dart';
import 'package:easycook_flutter/ui/screens/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String imageSelect = "Imagen no seleccionada";
  FilePickerResult? result;
  PlatformFile? file;
  final _imagePicker = ImagePicker();

  String date = "";
  DateTime selectedDate = DateTime.now();

  late AuthRepository authRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombre = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController nick = TextEditingController();
  TextEditingController ciudad = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repetirPassword = TextEditingController();

  late Future<SharedPreferences> _prefs;
  final String uploadUrl = 'http://10.0.2.2:8080/auth/register';
  String pathAvatar = "";

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _prefs = SharedPreferences.getInstance();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return ImageBloc();
          }),
          BlocProvider(
            create: (context) {
              return RegisterBloc(authRepository);
            },
          ),
        ],
        child: _createBody(context),
      ),
    );
  }

  _createBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondoUserYRegister.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocConsumer<RegisterBloc, RegisterState>(
              listenWhen: (context, state) {
            return state is RegisterSuccessState || state is LoginErrorState;
          }, listener: (context, state) async {
            if (state is RegisterSuccessState) {
              _registerSuccess(context, state.registerResponse);
            } else if (state is LoginErrorState) {
              _showSnackbar(context, state.message);
            }
          }, buildWhen: (context, state) {
            return state is RegisterInitial || state is RegisterLoading;
          }, builder: (ctx, state) {
            if (state is RegisterInitial) {
              return _register(ctx);
            } else if (state is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _register(ctx);
            }
          })),
    );
  }

  Future<void> _registerSuccess(
      BuildContext context, RegisterResponse late) async {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString('token', late.email);
      prefs.setString('id', late.id);
      prefs.setString('avatar', late.avatar);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _register(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                                hintText: 'Email',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter @';
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
                            margin: EdgeInsets.only(top: 20, bottom: 15),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocConsumer<ImageBloc, ImageState>(
                                listenWhen: (context, state) {
                                  return state is ImageSelectedSuccessState;
                                },
                                listener: (context, state) {},
                                buildWhen: (context, state) {
                                  return state is ImageState ||
                                      state is ImageSelectedSuccessState;
                                },
                                builder: (context, state) {
                                  if (state is ImageSelectedSuccessState) {
                                    pathAvatar = state.pickedFile.path;
                                    print('PATH ${state.pickedFile.path}');
                                    return Column(children: [
                                      Image.file(
                                        File(state.pickedFile.path),
                                        height: 50,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setString('avatar', pathAvatar);
                                        },
                                        child: const Text('avatar'),
                                      )
                                    ]);
                                  }
                                  return Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Color.fromRGBO(
                                                  200, 200, 200, 1)),
                                          onPressed: () {
                                            BlocProvider.of<ImageBloc>(context)
                                                .add(const SelectImageEvent(
                                                    ImageSource.gallery));
                                          },
                                          child: const Text(
                                            'avatar',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1)),
                                          )));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          elevation: 5,
                          primary: Color.fromRGBO(27, 125, 255, 1),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final registerDto = RegisterDto(
                                nombre: nombre.text,
                                apellidos: apellidos.text,
                                nick: nick.text,
                                ciudad: ciudad.text,
                                email: email.text,
                                password: password.text,
                                repetirPassword: repetirPassword.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
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
            height: 80,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Login');
              },
              child: Text(
                'Logueate Aquí',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 131, 255, 1)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
