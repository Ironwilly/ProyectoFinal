import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'agregar_receta_event.dart';
part 'agregar_receta_state.dart';

class AgregarRecetaBloc extends Bloc<AgregarRecetaEvent, AgregarRecetaState> {
  AgregarRecetaBloc() : super(AgregarRecetaInitial()) {
    on<AgregarRecetaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
