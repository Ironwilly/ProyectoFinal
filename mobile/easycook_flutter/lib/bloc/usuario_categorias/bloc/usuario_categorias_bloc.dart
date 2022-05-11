import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_categorias_event.dart';
part 'usuario_categorias_state.dart';

class UsuarioCategoriasBloc extends Bloc<UsuarioCategoriasEvent, UsuarioCategoriasState> {
  UsuarioCategoriasBloc() : super(UsuarioCategoriasInitial()) {
    on<UsuarioCategoriasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
