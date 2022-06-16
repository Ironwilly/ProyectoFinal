import 'package:easycook_flutter/models/user_response.dart';

abstract class UserRecetaRepository {
  Future<UserRecetaResponse> fetchUsers();
}
