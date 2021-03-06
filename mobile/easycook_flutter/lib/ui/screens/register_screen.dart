import 'dart:io';
import 'package:easycook_flutter/bloc/bloc/fondoimagen_bloc.dart';
import 'package:easycook_flutter/bloc/image_pick_block/image_pick_bloc.dart';

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

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return RegisterBloc(authRepository);
        }),
        BlocProvider(create: (context) {
          return ImagePickBlocBloc();
        })
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _createBody(context),
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondoUserYRegister.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(CustomStyles.bodyPadding),
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listenWhen: (context, state) {
                return state is RegisterSuccessState ||
                    state is RegisterErrorState;
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
                return state is RegisterInitialState ||
                    state is RegisterLoadingState;
              },
              builder: (context, state) {
                if (state is RegisterInitialState) {
                  return _buildForm(context);
                } else if (state is RegisterLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _buildForm(context);
                }
              },
            )));
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 950,
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
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Nombre',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(100, 100, 100, 1)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.0))),
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
                          hintText: 'Contrase??a',
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
                          hintText: 'Repita su contrase??a',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocConsumer<ImagePickBlocBloc, ImagePickBlocState>(
                          listenWhen: (context, state) {
                            return state is ImageSelectedSuccessState;
                          },
                          listener: (context, state) {},
                          buildWhen: (context, state) {
                            return state is ImagePickBlocInitial ||
                                state is ImageSelectedSuccessState;
                          },
                          builder: (context, state) {
                            if (state is ImageSelectedSuccessState) {
                              print('PATH ${state.pickedFile.path}');
                              return Column(children: [
                                Image.file(
                                  File(state.pickedFile.path),
                                  height: 50,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      PreferenceUtils.setString(
                                          Constants.SHARED_AVATAR_IMAGE_PATH,
                                          state.pickedFile.path);
                                    },
                                    child: const Text('Subir imagen'))
                              ]);
                            }
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<ImagePickBlocBloc>(context)
                                      .add(const SelectImageEvent(
                                          ImageSource.gallery));
                                },
                                child: Image.asset(
                                  'assets/images/avatarPlantilla.png',
                                  width: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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
                          BlocProvider.of<RegisterBloc>(context).add(
                              DoRegisterEvent(
                                  registerDto,
                                  PreferenceUtils.getString(
                                      Constants.SHARED_AVATAR_IMAGE_PATH)!));
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '??No tienes una cuenta?',
              style: CustomStyles.secondaryText,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Logu??ate',
                  style: CustomStyles.secondaryLinkText,
                ),
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
