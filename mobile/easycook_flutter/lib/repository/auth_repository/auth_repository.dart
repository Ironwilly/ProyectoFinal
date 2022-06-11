import 'package:easycook_flutter/models/login_dto.dart';
import 'package:easycook_flutter/models/login_response.dart';
import 'package:easycook_flutter/models/register_dto.dart';
import 'package:easycook_flutter/models/register_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<RegisterResponse> register(
      RegisterDto registerDto, String avatar, String fondo);
}
