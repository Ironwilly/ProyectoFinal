class RecetaDto {
  String? ingredientes;
  String? preparacion;
  String? tiempoCocinar;
  String? recetaCategoria;

  RecetaDto(
      {this.ingredientes,
      this.preparacion,
      this.tiempoCocinar,
      this.recetaCategoria});

  RecetaDto.fromJson(Map<String, dynamic> json) {
    ingredientes = json['ingredientes'];
    preparacion = json['preparacion'];
    tiempoCocinar = json['tiempoCocinar'];
    recetaCategoria = json['recetaCategoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ingredientes'] = ingredientes;
    data['preparacion'] = preparacion;
    data['tiempoCocinar'] = tiempoCocinar;
    data['recetaCategoria'] = recetaCategoria;
    return data;
  }
}
