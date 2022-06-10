import 'package:bloc/bloc.dart';
import 'package:easycook_flutter/bloc/image_bloc/bloc/image_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'fondoimagen_event.dart';
part 'fondoimagen_state.dart';

class FondoimagenBloc extends Bloc<FondoimagenEvent, FondoimagenState> {
  FondoimagenBloc() : super(FondoimagenInitial()) {
    on<SelectFondoimagenEvent>(_onSelectImage);
  }

  void _onSelectImage(
      SelectFondoimagenEvent event2, Emitter<FondoimagenState> emit) async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedFile2 =
          await _picker.pickImage(source: event2.source2);
      if (pickedFile2 != null) {
        emit(FondoSelectedSuccessState(pickedFile2));
      } else {
        emit(const FondoSelectedErrorState('Error en la imagen seleccionada'));
      }
    } catch (e) {
      emit(const FondoSelectedErrorState('Error en la imagen seleccionada'));
    }
  }
}
