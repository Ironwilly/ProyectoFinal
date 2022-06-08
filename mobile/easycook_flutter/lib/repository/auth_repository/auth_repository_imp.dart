import 'package:easycook_flutter/models/login_dto.dart';
import 'package:easycook_flutter/models/login_response.dart';
import 'package:easycook_flutter/repository/auth_repository/auth_repository.dart';
import 'package:http/http.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override 
  Future<LoginResponse> login(LoginDto loginDto) async {

    SharedPre
  }
}
