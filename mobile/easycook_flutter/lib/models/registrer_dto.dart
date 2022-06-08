class RegisterDto {
  RegisterDto({
    required this.nombre,
    required this.apellidos,
    required this.nick,
    required this.ciudad,
    required this.email,
    required this.password,
    required this.repetirPassword,
  });
  late final String nombre;
  late final String apellidos;
  late final String nick;
  late final String ciudad;
  late final String email;
  late final String password;
  late final String repetirPassword;

  RegisterDto.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    nick = json['nick'];
    ciudad = json['ciudad'];
    email = json['email'];
    password = json['password'];
    repetirPassword = json['repetirPassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nombre'] = nombre;
    _data['apellidos'] = apellidos;
    _data['nick'] = nick;
    _data['ciudad'] = ciudad;
    _data['email'] = email;
    _data['password'] = password;
    _data['repetirPassword'] = repetirPassword;
    return _data;
  }
}
