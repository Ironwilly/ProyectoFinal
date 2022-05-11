import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pastas_event.dart';
part 'pastas_state.dart';

class PastasBloc extends Bloc<PastasEvent, PastasState> {
  PastasBloc() : super(PastasInitial()) {
    on<PastasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
