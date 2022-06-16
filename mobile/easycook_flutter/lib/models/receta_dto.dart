class RecetaDto {
  String? ingredientes;
  String? preparacion;
  String? tiempoCocinar;

  RecetaDto({
    this.ingredientes,
    this.preparacion,
    this.tiempoCocinar,
  });

  RecetaDto.fromJson(Map<String, dynamic> json) {
    ingredientes = json['ingredientes'];
    preparacion = json['preparacion'];
    tiempoCocinar = json['tiempoCocinar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ingredientes'] = ingredientes;
    data['preparacion'] = preparacion;
    data['tiempoCocinar'] = tiempoCocinar;
    return data;
  }
}
