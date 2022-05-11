import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dulces_event.dart';
part 'dulces_state.dart';

class DulcesBloc extends Bloc<DulcesEvent, DulcesState> {
  DulcesBloc() : super(DulcesInitial()) {
    on<DulcesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
