import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'busqueda_receta_event.dart';
part 'busqueda_receta_state.dart';

class BusquedaRecetaBloc extends Bloc<BusquedaRecetaEvent, BusquedaRecetaState> {
  BusquedaRecetaBloc() : super(BusquedaRecetaInitial()) {
    on<BusquedaRecetaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
