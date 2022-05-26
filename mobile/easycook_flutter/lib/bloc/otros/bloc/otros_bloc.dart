import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otros_event.dart';
part 'otros_state.dart';

class OtrosBloc extends Bloc<OtrosEvent, OtrosState> {
  OtrosBloc() : super(OtrosInitial()) {
    on<OtrosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
