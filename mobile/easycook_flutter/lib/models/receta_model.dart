class Receta {
  Receta({
    required this.id,
    required this.ingredientes,
    required this.preparacion,
    required this.tiempoCocinar,
    required this.fotoReceta,
  });
  late final String id;
  late final String ingredientes;
  late final String preparacion;
  late final String tiempoCocinar;
  late final String fotoReceta;

  Receta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ingredientes = json['ingredientes'];
    preparacion = json['preparacion'];
    tiempoCocinar = json['tiempoCocinar'];
    fotoReceta = json['fotoReceta'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['ingredientes'] = ingredientes;
    _data['preparacion'] = preparacion;
    _data['tiempoCocinar'] = tiempoCocinar;
    _data['fotoReceta'] = fotoReceta;
    return _data;
  }
}
