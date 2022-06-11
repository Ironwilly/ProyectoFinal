import 'package:easycook_flutter/bloc/login/login_bloc.dart';
import 'package:easycook_flutter/models/login_dto.dart';
import 'package:easycook_flutter/models/login_response.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository_imp.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
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
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Future<SharedPreferences> _prefs;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _prefs = SharedPreferences.getInstance();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return LoginBloc(authRepository);
        },
        child: _createBody(context));
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondoUserYRegister.png'),
              fit: BoxFit.cover,
            ),
          ),
          child:
              BlocConsumer<LoginBloc, LoginState>(listenWhen: (context, state) {
            return state is LoginSuccessState || state is LoginErrorState;
          }, listener: (context, state) async {
            if (state is LoginSuccessState) {
              _loginSuccess(context, state.loginResponse);
            } else if (state is LoginErrorState) {
              _showSnackbar(context, state.message);
            }
          }, buildWhen: (context, state) {
            return state is LoginInitial || state is LoginLoadingState;
          }, builder: (ctx, state) {
            if (state is LoginInitial) {
              return _login(ctx);
            } else if (state is LoginLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _login(ctx);
            }
          })),
    );
  }

  Future<void> _loginSuccess(BuildContext context, LoginResponse late) async {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString('token', late.token);
      prefs.setString('avatar', late.avatar);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Recetas()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login(BuildContext context) {
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
                      key: _formkey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            key: _formkey,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                              ),
                              validator: (String? value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please enter some text with @';
                                }
                                return null;
                              },
                              onSaved: (String? value) {},
                              controller: emailController,
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 130,
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
                        ],
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
                          if (_formkey.currentState!.validate()) {
                            final loginDto = LoginDto(
                                email: emailController.text,
                                password: passwordController.text);
                            BlocProvider.of<LoginBloc>(context)
                                .add(DoLoginEvent(loginDto));
                          }
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
