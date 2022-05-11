import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editar_event.dart';
part 'editar_state.dart';

class EditarBloc extends Bloc<EditarEvent, EditarState> {
  EditarBloc() : super(EditarInitial()) {
    on<EditarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
