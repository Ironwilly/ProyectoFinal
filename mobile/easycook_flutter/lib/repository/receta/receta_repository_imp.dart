import 'dart:convert';

import 'package:easycook_flutter/models/receta_dto.dart';
import 'package:easycook_flutter/models/receta_model.dart';
import 'package:http/http.dart' as http;
import 'package:easycook_flutter/repository/receta/receta_repository.dart';

import 'package:easycook_flutter/utils/constants.dart';
import 'package:easycook_flutter/utils/preferences.dart';
import 'package:http_parser/http_parser.dart';

class RecetaRepositoryImpl extends RecetaRepository {
  @override
  Future<List<Receta>> fetchRecetas(String type) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/receta/$type'), headers: {
      'Authorization':
          'Bearer ${PreferenceUtils.getString(Constants.SHARED_BEARER_TOKEN)}'
    });
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body))
          .map((e) => Receta.fromJson(e))
          .toList();
    } else if (response.statusCode == 404) {
      return List.empty(growable: false);
    } else {
      print(response.statusCode);
      throw Exception('Failed to load recetas');
    }
  }

  @override
  Future<Receta> createReceta(RecetaDto recetaDto, String imagePath) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization':
          'Bearer ${PreferenceUtils.getString(Constants.SHARED_BEARER_TOKEN)}'
    };
    var uri = Uri.parse('http://10.0.2.2:8080/receta/');
    var body = jsonEncode({
      'ingredientes': recetaDto.ingredientes,
      'preparacion': recetaDto.preparacion,
      'tiempoCocinar': recetaDto.tiempoCocinar,
      'recetaCategoria': recetaDto.tiempoCocinar
    });
    var request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('receta', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('recetaImagen', imagePath,
          contentType: MediaType('recetaImagen', 'jpg')))
      ..headers.addAll(headers);

    final response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 201) {
      return Receta.fromJson(jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
