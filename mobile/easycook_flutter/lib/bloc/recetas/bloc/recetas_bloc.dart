import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recetas_event.dart';
part 'recetas_state.dart';

class RecetasBloc extends Bloc<RecetasEvent, RecetasState> {
  RecetasBloc() : super(RecetasInitial()) {
    on<RecetasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
