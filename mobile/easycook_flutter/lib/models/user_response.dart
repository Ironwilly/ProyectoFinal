class UserRecetaResponse {
  int? id;
  String? ingredientes;
  String? preparacion;
  String? tiempoCocinar;
  String? fotoReceta;
  String? nickUsuario;
  String? nombreUsuario;
  String? avatarUsuario;
  String? ciudadUsuario;

  UserRecetaResponse(
      {this.id,
      this.ingredientes,
      this.preparacion,
      this.tiempoCocinar,
      this.fotoReceta,
      this.nickUsuario,
      this.nombreUsuario,
      this.avatarUsuario,
      this.ciudadUsuario});

  UserRecetaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ingredientes = json['ingredientes'];
    preparacion = json['preparacion'];
    tiempoCocinar = json['tiempoCocinar'];
    fotoReceta = json['fotoReceta'];
    nickUsuario = json['nickUsuario'];
    nombreUsuario = json['nombreUsuario'];
    avatarUsuario = json['avatarUsuario'];
    ciudadUsuario = json['ciudadUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ingredientes'] = ingredientes;
    data['preparacion'] = preparacion;
    data['tiempoCocinar'] = tiempoCocinar;
    data['fotoReceta'] = fotoReceta;
    data['nickUsuario'] = nickUsuario;
    data['nombreUsuario'] = nombreUsuario;
    data['avatarUsuario'] = avatarUsuario;
    data['ciudadUsuario'] = ciudadUsuario;
    return data;
  }
}
