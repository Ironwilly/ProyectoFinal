import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_recientes_event.dart';
part 'usuario_recientes_state.dart';

class UsuarioRecientesBloc extends Bloc<UsuarioRecientesEvent, UsuarioRecientesState> {
  UsuarioRecientesBloc() : super(UsuarioRecientesInitial()) {
    on<UsuarioRecientesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
