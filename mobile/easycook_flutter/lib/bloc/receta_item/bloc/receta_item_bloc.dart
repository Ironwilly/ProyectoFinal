import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'receta_item_event.dart';
part 'receta_item_state.dart';

class RecetaItemBloc extends Bloc<RecetaItemEvent, RecetaItemState> {
  RecetaItemBloc() : super(RecetaItemInitial()) {
    on<RecetaItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
