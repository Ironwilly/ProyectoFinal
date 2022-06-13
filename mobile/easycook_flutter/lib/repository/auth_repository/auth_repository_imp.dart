import 'package:easycook_flutter/models/register_dto.dart';
import 'package:easycook_flutter/models/register_response.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:easycook_flutter/models/login_dto.dart';
import 'package:easycook_flutter/models/login_response.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      // 'Authorization': 'Bearer $token'
    };

    final response = await _client.post(
        Uri.parse('http://10.0.2.2:8080/auth/login'),
        headers: headers,
        body: jsonEncode(loginDto.toJson()));

    print(response.statusCode);

    if (response.statusCode == 200) {
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
      'Content-Type': 'multipart/form-data',
      // 'Authorization': 'Bearer $token'
    };

    var uri = Uri.parse('http://10.0.2.2:8080/auth/register');
    var body = jsonEncode({
      'nombre': registerDto.nombre,
      'apellidos': registerDto.apellidos,
      'nick': registerDto.nick,
      'ciudad': registerDto.ciudad,
      'email': registerDto.email,
      'password': registerDto.password,
      'repetirPassword': registerDto.repetirPassword
    });

    var request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('usuario', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('avatar', avatar,
          contentType: MediaType('avatar', 'jpg')))
      ..headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) print('Uploaded!');

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.statusCode);
      throw Exception('Revisa que te has confundido');
    }
  }
}
