import 'package:easycook_flutter/bloc/login/login_bloc.dart';
import 'package:easycook_flutter/models/login_dto.dart';

import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository_imp.dart';
import 'package:easycook_flutter/styles.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:easycook_flutter/utils/constants.dart';
import 'package:easycook_flutter/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthRepository authRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    return BlocProvider(
      create: (context) {
        return LoginBloc(authRepository);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _createBody(context),
      ),
    );
  }

  _createBody(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondoUserYRegister.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(CustomStyles.bodyPadding),
            child: BlocConsumer<LoginBloc, LoginState>(
              listenWhen: (context, state) {
                return state is LoginSuccessState || state is LoginErrorState;
              },
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  PreferenceUtils.setString(
                      Constants.SHARED_BEARER_TOKEN, state.loginResponse.token);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Recetas()));
                } else if (state is LoginErrorState) {
                  _showSnackbar(context, state.message);
                }
              },
              buildWhen: (context, state) {
                return state is LoginInitialState || state is LoginLoadingState;
              },
              builder: (context, state) {
                if (state is LoginInitialState) {
                  return _buildForm(context);
                } else if (state is LoginLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _buildForm(context);
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

  _buildForm(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
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
          height: 548,
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
                          margin: const EdgeInsets.only(top: 50),
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            onSaved: (String? value) {},
                            validator: (String? value) {
                              if (value == null || !value.contains('@')) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 130,
                          margin: const EdgeInsets.only(top: 80),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Contraseña',
                            ),
                            onSaved: (String? value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              final loginDto = LoginDto(
                                  email: emailController.text,
                                  password: passwordController.text);
                              BlocProvider.of<LoginBloc>(context)
                                  .add(DoLoginEvent(loginDto));
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
                                'Entrar'.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '¿No tienes una cuenta?',
            style: CustomStyles.secondaryText,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/register'),
              child: Text(
                'Regístrate',
                style: CustomStyles.secondaryLinkText,
              ),
            ),
          )
        ]),
      ]),
    ));
  }
}
