import 'package:easycook_flutter/models/register_dto.dart';
import 'package:easycook_flutter/models/register_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:easycook_flutter/models/login_dto.dart';
import 'package:easycook_flutter/models/login_response.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';
import 'package:http_parser/http_parser.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      // 'Authorization': 'Bearer $token'
    };

    final response = await _client.post(
        Uri.parse('http://10.0.2.2:8080/auth/login'),
        headers: headers,
        body: jsonEncode(loginDto.toJson()));

    print(response.statusCode);

    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fallo al logarte');
    }
  }

  @override
  Future<RegisterResponse> register(
      RegisterDto registerDto, String avatar) async {
    Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
      // 'Authorization': 'Bearer $token'
    };
    Map<String, String> headers2 = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token'
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var uri = Uri.parse('http://10.0.2.2:8080/auth/register');
    var request = http.MultipartRequest('POST', uri);
    request.fields['nombre'] = registerDto.nombre.toString();
    request.fields['apellidos'] = registerDto.apellidos.toString();
    request.fields['nick'] = registerDto.nick.toString();
    request.fields['ciudad'] = registerDto.ciudad.toString();
    request.fields['email'] = registerDto.email.toString();
    request.fields['password'] = registerDto.password.toString();
    request.fields['repetirPassword'] = registerDto.repetirPassword.toString();
    request.files.add(await http.MultipartFile.fromPath(
        'avatar', prefs.getString('avatar').toString()));

    final response = await request.send();

    print(response.statusCode);
    if (response.statusCode == 201) print('Uploaded!');

    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.statusCode);
      throw Exception('Revisa que te has confundido');
    }
  }
}
