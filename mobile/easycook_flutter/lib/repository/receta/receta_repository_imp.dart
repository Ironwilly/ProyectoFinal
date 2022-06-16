import 'dart:convert';

import 'package:easycook_flutter/models/receta_dto.dart';
import 'package:easycook_flutter/models/receta_model.dart';
import 'package:http/http.dart' as http;
import 'package:easycook_flutter/repository/receta/receta_repository.dart';

import 'package:easycook_flutter/utils/constants.dart';
import 'package:easycook_flutter/utils/preferences.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class RecetaRepositoryImpl extends RecetaRepository {
  final Client _client = Client();

  @override
  Future<List<Receta>> fetchRecetas(String type) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${PreferenceUtils.getString(Constants.SHARED_BEARER_TOKEN)}'
    };

    final response = await _client.get(
      Uri.parse('http://10.0.2.2:8080/receta/'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => Receta.fromJson(i))
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
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Authorization':
          'Bearer ${PreferenceUtils.getString(Constants.SHARED_BEARER_TOKEN)}',
      'Accept': 'application/json; charset=UTF-8'
    };
    var uri = Uri.parse('http://10.0.2.2:8080/receta/');
    var body = jsonEncode({
      'ingredientes': recetaDto.ingredientes,
      'preparacion': recetaDto.preparacion,
      'tiempoCocinar': recetaDto.tiempoCocinar,
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
