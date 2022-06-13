import 'dart:io';
import 'package:easycook_flutter/bloc/bloc/fondoimagen_bloc.dart';
import 'package:easycook_flutter/bloc/image_bloc/bloc/image_bloc.dart';
import 'package:easycook_flutter/bloc/register/bloc/register_bloc.dart';
import 'package:easycook_flutter/models/register_dto.dart';
import 'package:easycook_flutter/models/register_response.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository_imp.dart';
import 'package:easycook_flutter/styles.dart';
import 'package:easycook_flutter/ui/screens/login.dart';
import 'package:easycook_flutter/utils/constants.dart';
import 'package:easycook_flutter/utils/preferences.dart';
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
  late AuthRepository authRepository;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController nickController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repetirPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
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
          BlocProvider(
            create: (context) {
              return FondoimagenBloc();
            },
          ),
          BlocProvider(
            create: (context) {
              return RegisterBloc(authRepository);
            },
          )
        ],
        child: _createBody(context),
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(CustomStyles.bodyPadding),
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listenWhen: (context, state) {
                return state is RegisterSuccessState || state is RegisterState;
              },
              listener: (context, state) {
                if (state is RegisterSuccessState) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                } else if (state is RegisterErrorState) {
                  _showSnackbar(context, state.message);
                }
              },
              buildWhen: (context, state) {
                return state is RegisterInitial || state is RegisterLoading;
              },
              builder: (context, state) {
                if (state is RegisterInitial) {
                  return _register(context);
                } else if (state is RegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _register(context);
                }
              },
            )),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _register(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'MiarmaApp',
            style: CustomStyles.loginTitleText,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Regístrate para ver las fotos y vídeos de tus amigos',
              style: CustomStyles.registerSubText,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              const Divider(
                color: CustomStyles.secondaryTextColor,
                thickness: 1.0,
              ),
              Container(
                width: 50.0,
                color: Colors.white,
                child: Text(
                  'O',
                  style: CustomStyles.secondaryText,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 700,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<ImageBloc, ImageState>(
                    listenWhen: (context, state) {
                      return state is ImageSelectedSuccessState;
                    },
                    listener: (context, state) {},
                    buildWhen: (context, state) {
                      return state is ImageInitial ||
                          state is ImageSelectedSuccessState;
                    },
                    builder: (context, state) {
                      if (state is ImageSelectedSuccessState) {
                        print('PATH ${state.pickedFile.path}');
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(state.pickedFile.path),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  PreferenceUtils.setString(
                                      Constants.SHARED_AVATAR_IMAGE_PATH,
                                      state.pickedFile.path);
                                },
                                child: const Text('Subir imagen'))
                          ],
                        );
                      }
                      return Center(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<ImageBloc>(context).add(
                                const SelectImageEvent(ImageSource.gallery));
                          },
                          child: Image.asset(
                            'assets/images/avatarPlantilla.png',
                            width: 150,
                          ),
                        ),
                      );
                    },
                  ),
                  TextFormField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Nombre',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your name'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: apellidosController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Apellidos',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your last name'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: nickController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Nick',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your nick'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: ciudadController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Ciudad/Pueblo',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your nick'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || !value.contains('@'))
                          ? 'Email not valid'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Contraseña',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your password'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: repetirPasswordController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Repita su contraseña',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write again your password'
                          : null;
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final registerDto = RegisterDto(
                            nombre: nombreController.text,
                            apellidos: apellidosController.text,
                            nick: nickController.text,
                            ciudad: ciudadController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            repetirPassword: repetirPasswordController.text);
                        BlocProvider.of<RegisterBloc>(context)
                            .add(DoRegisterEvent(
                          registerDto,
                          PreferenceUtils.getString(
                              Constants.SHARED_AVATAR_IMAGE_PATH)!,
                        ));
                      }
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        decoration: BoxDecoration(
                            color: CustomStyles.loginButtonColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Registrarse'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Al registarte, aceptas nuestros Términos, Política de Datos y Política de Cookies.',
              style: CustomStyles.secondaryText,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Ya tienes una cuenta?',
                style: CustomStyles.secondaryText,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Inicia sesión',
                    style: CustomStyles.secondaryLinkText,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
