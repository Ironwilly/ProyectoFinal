import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editar_perfil_event.dart';
part 'editar_perfil_state.dart';

class EditarPerfilBloc extends Bloc<EditarPerfilEvent, EditarPerfilState> {
  EditarPerfilBloc() : super(EditarPerfilInitial()) {
    on<EditarPerfilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
