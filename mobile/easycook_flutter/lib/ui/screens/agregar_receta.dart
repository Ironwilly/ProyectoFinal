import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easycook_flutter/bloc/image_pick_block/image_pick_bloc.dart';
import 'package:easycook_flutter/bloc/recetas/bloc/recetas_bloc.dart';
import 'package:easycook_flutter/models/receta_dto.dart';
import 'package:easycook_flutter/models/receta_model.dart';
import 'package:easycook_flutter/repository/receta/receta_repository.dart';
import 'package:easycook_flutter/repository/receta/receta_repository_imp.dart';
import 'package:easycook_flutter/styles.dart';
import 'package:easycook_flutter/ui/screens/menu.dart';
import 'package:easycook_flutter/ui/screens/perfil.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:easycook_flutter/utils/constants.dart';
import 'package:easycook_flutter/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class AgregarReceta extends StatefulWidget {
  const AgregarReceta({Key? key}) : super(key: key);

  @override
  State<AgregarReceta> createState() => _AgregarReceta();
}

class _AgregarReceta extends State<AgregarReceta> {
  late RecetaRepository recetaRepository;
  late Future<SharedPreferences> _prefs;
  final _formKey = GlobalKey<FormState>();
  TextEditingController ingredientesController = TextEditingController();
  TextEditingController preparacionController = TextEditingController();
  TextEditingController tiempoCocinarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    recetaRepository = RecetaRepositoryImpl();
    _prefs = SharedPreferences.getInstance();
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
          return RecetasBloc(recetaRepository);
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
        child: Center(
      child: Padding(
          padding: const EdgeInsets.all(CustomStyles.bodyPadding),
          child: BlocConsumer<RecetasBloc, RecetasState>(
              listenWhen: (context, state) {
            return state is RecetasSuccessState || state is RecetasErrorState;
          }, listener: (context, state) {
            if (state is RecetasSuccessState) {
              _loginSuccess(context, state.loginResponse);
            } else if (state is RecetasErrorState) {
              _showSnackbar(context, state.message);
            }
          }, buildWhen: (context, state) {
            return state is RecetasInitial || state is RecetasLoading;
          }, builder: (context, state) {
            if (state is RecetasInitial) {
              return _buildForm(context);
            } else if (state is RecetasLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _buildForm(context);
            }
          })),
    ));
  }

  Future<void> _loginSuccess(BuildContext context, Receta late) async {
    _prefs.then((SharedPreferences prefs) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Menu()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            height: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo5.png'),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 800,
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
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
                          return Column(
                            children: [
                              Image.file(
                                File(state.pickedFile.path),
                                width: 300,
                                height: 300,
                                fit: BoxFit.fill,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<ImagePickBlocBloc>(context)
                                        .add(const SelectImageEvent(
                                            ImageSource.gallery));
                                  },
                                  child: const Text('Subir foto receta'))
                            ],
                          );
                        }
                        return Column(
                          children: [
                            Center(
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<ImagePickBlocBloc>(context)
                                      .add(const SelectImageEvent(
                                          ImageSource.gallery));
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  size: 40,
                                ),
                              ),
                            ),
                            Text('Foto receta')
                          ],
                        );
                      },
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20, top: 10),
                          child: TextFormField(
                            controller: ingredientesController,
                            maxLines: null,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                hintText: 'Ingredientes',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 5.0))),
                            onSaved: (String? value) {},
                            validator: (String? value) {
                              return (value == null || value.isEmpty)
                                  ? 'Ingredientes not valid'
                                  : null;
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                  controller: preparacionController,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Preparación',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 5.0))),
                                  onSaved: (String? value) {},
                                  validator: (String? value) {
                                    return (value == null || value.isEmpty)
                                        ? 'You need to write some content'
                                        : null;
                                  },
                                )),
                          ],
                        ),
                        TextFormField(
                          controller: tiempoCocinarController,
                          maxLines: null,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'TiempoCocinar',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 5.0))),
                          onSaved: (String? value) {},
                          validator: (String? value) {
                            return (value == null || value.isEmpty)
                                ? 'You need to write some content'
                                : null;
                          },
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final recetaDto = RecetaDto(
                            ingredientes:
                                ingredientesController.text.toString(),
                            preparacion: preparacionController.text.toString(),
                            tiempoCocinar:
                                tiempoCocinarController.text.toString(),
                          );
                          BlocProvider.of<RecetasBloc>(context).add(
                              CreateRecetaEvent(
                                  recetaDto,
                                  PreferenceUtils.getString(
                                      Constants.SHARED_RECETA_IMAGE_PATH)!));
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
                            'Publicar'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
