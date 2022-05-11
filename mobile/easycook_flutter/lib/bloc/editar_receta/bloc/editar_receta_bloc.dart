import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editar_receta_event.dart';
part 'editar_receta_state.dart';

class EditarRecetaBloc extends Bloc<EditarRecetaEvent, EditarRecetaState> {
  EditarRecetaBloc() : super(EditarRecetaInitial()) {
    on<EditarRecetaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
