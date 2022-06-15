import 'package:easycook_flutter/models/receta_dto.dart';
import 'package:easycook_flutter/models/receta_model.dart';

abstract class RecetaRepository {
  Future<List<Receta>> fetchRecetas(String type);
  Future<Receta> createReceta(RecetaDto recetaDto, String imagePath);
}
