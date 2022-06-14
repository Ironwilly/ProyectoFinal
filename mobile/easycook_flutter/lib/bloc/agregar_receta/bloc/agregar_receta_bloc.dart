import 'package:bloc/bloc.dart';
import 'package:easycook_flutter/models/receta_dto.dart';
import 'package:easycook_flutter/models/receta_model.dart';
import 'package:easycook_flutter/repository/receta/receta_repository.dart';
import 'package:easycook_flutter/ui/screens/recetas.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'agregar_receta_event.dart';
part 'agregar_receta_state.dart';

class AgregarRecetaBloc extends Bloc<AgregarRecetaEvent, AgregarRecetaState> {
  final RecetaRepository recetaRepository;

  AgregarRecetaBloc(this.recetaRepository) : super(AgregarRecetaInitial()) {
    on<AgregarReceta>(_agregarRecetaEvent);
  }

  void _agregarRecetaEvent(
      AgregarReceta event, Emitter<AgregarRecetaState> emit) async {
    try {
      final recetaResponse =
          await recetaRepository.createReceta(event.recetaDto, event.imagePath);
      emit(AgregarRecetaSuccessState(recetaResponse));
      return;
    } on Exception catch (e) {
      emit(RecetaCreateError(e.toString()));
    }
  }
}
