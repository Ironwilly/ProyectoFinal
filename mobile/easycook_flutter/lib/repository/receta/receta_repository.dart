import 'package:easycook_flutter/models/receta_dto.dart';
import 'package:easycook_flutter/ui/screens/receta_item.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';

abstract class RecetaRepository {
  Future<List<Recetas>> fetchRecetas(String type);
  Future<Recetas> createReceta(RecetaDto recetaDto, String imagePath);
}
