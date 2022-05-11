import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mis_recetas_event.dart';
part 'mis_recetas_state.dart';

class MisRecetasBloc extends Bloc<MisRecetasEvent, MisRecetasState> {
  MisRecetasBloc() : super(MisRecetasInitial()) {
    on<MisRecetasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
