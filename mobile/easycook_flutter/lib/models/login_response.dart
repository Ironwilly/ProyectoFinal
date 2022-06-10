class LoginResponse {
  LoginResponse({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.nick,
    required this.email,
    required this.avatar,
    required this.token,
  });
  late final String id;
  late final String nombre;
  late final String apellidos;
  late final String nick;
  late final String email;
  late final String avatar;
  late final String token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    nick = json['nick'];
    email = json['email'];
    avatar = json['avatar'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['apellidos'] = apellidos;
    _data['nick'] = nick;
    _data['email'] = email;
    _data['avatar'] = avatar;
    _data['token'] = token;
    return _data;
  }
}
