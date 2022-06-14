class Receta {
  String? id;
  String? ingredientes;
  String? preparacion;
  String? tiempoCocinar;
  String? recetaCategoria;
  String? fotoReceta;

  Receta(
      {this.id,
      this.ingredientes,
      this.preparacion,
      this.tiempoCocinar,
      this.recetaCategoria,
      this.fotoReceta});

  Receta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ingredientes = json['ingredientes'];
    preparacion = json['preparacion'];
    tiempoCocinar = json['tiempoCocinar'];
    recetaCategoria = json['recetaCategoria'];
    fotoReceta = json['fotoReceta'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['ingredientes'] = ingredientes;
    data['preparacion'] = preparacion;
    data['tiempoCocinar'] = tiempoCocinar;
    data['recetaCategoria'] = recetaCategoria;
    data['fotoReceta'] = fotoReceta;
    return data;
  }
}
