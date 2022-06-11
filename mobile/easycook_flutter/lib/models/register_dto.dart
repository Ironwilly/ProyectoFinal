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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['apellidos'] = this.apellidos;
    data['nick'] = this.nick;
    data['ciudad'] = this.ciudad;
    data['email'] = this.email;
    data['password'] = this.password;
    data['repetirPassword'] = this.repetirPassword;
    return data;
  }
}
