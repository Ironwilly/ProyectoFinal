import 'package:bloc/bloc.dart';
import 'package:easycook_flutter/models/receta_model.dart';
import 'package:easycook_flutter/repository/receta/receta_repository.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'recetas_event.dart';
part 'recetas_state.dart';

class RecetasBloc extends Bloc<RecetasEvent, RecetasState> {
  final RecetaRepository recetaRepository;

  RecetasBloc(this.recetaRepository) : super(RecetasInitial()) {
    on<FetchReceta>(_recetasFetched);
  }

  void _recetasFetched(FetchReceta event, Emitter<RecetasState> emit) async {
    try {
      final recetas = await recetaRepository.fetchRecetas(event.type);
      emit(RecetasFetched(recetas, event.type));
    } on Exception catch (e) {
      emit(RecetaFetchError(e.toString()));
    }
  }
}
