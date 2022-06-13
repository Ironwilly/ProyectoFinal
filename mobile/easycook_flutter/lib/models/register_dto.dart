class RegisterDto {
  String? nombre;
  String? apellidos;
  String? nick;
  String? ciudad;
  String? email;
  String? password;
  String? repetirPassword;

  RegisterDto(
      {this.nombre,
      this.apellidos,
      this.nick,
      this.ciudad,
      this.email,
      this.password,
      this.repetirPassword});

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombre'] = nombre;
    data['apellidos'] = apellidos;
    data['nick'] = nick;
    data['ciudad'] = ciudad;
    data['email'] = email;
    data['password'] = password;
    data['repetirPassword'] = repetirPassword;
    return data;
  }
}
