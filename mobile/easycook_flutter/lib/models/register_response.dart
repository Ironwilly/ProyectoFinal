class RegisterResponse {
  RegisterResponse({
    required this.id,
    required this.nombre,
    required this.nick,
    required this.email,
    required this.avatar,
    required this.fondo,
    required this.rol,
  });
  late final String id;
  late final String nombre;
  late final String nick;
  late final String email;
  late final String avatar;
  late final String fondo;
  late final String rol;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    nick = json['nick'];
    email = json['email'];
    avatar = json['avatar'];
    fondo = json['fondo'];
    rol = json['rol'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['nick'] = nick;
    _data['email'] = email;
    _data['avatar'] = avatar;
    _data['fondo'] = fondo;
    _data['rol'] = rol;
    return _data;
  }
}
