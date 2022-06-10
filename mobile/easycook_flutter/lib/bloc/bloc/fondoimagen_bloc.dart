import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'fondoimagen_event.dart';
part 'fondoimagen_state.dart';

class FondoimagenBloc extends Bloc<FondoimagenEvent, FondoimagenState> {
  FondoimagenBloc() : super(FondoimagenInitial()) {
    on<SelectFondoimagenEvent>(_onSelectImage2);
  }

  void _onSelectImage2(
      SelectFondoimagenEvent event, Emitter<FondoimagenState> emit) async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedFile = await _picker.pickImage(source: event.source);
      if (pickedFile != null) {
        emit(FondoSelectedSuccessState(pickedFile));
      } else {
        emit(const FondoSelectedErrorState('Error en la imagen seleccionada'));
      }
    } catch (e) {
      emit(const FondoSelectedErrorState('Error en la imagen seleccionada'));
    }
  }
}
