import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuarios_lista_event.dart';
part 'usuarios_lista_state.dart';

class UsuariosListaBloc extends Bloc<UsuariosListaEvent, UsuariosListaState> {
  UsuariosListaBloc() : super(UsuariosListaInitial()) {
    on<UsuariosListaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
