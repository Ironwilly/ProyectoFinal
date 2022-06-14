part of 'agregar_receta_bloc.dart';

abstract class AgregarRecetaEvent extends Equatable {
  const AgregarRecetaEvent();

  @override
  List<Object> get props => [];
}

class AgregarReceta extends AgregarRecetaEvent {
  final RecetaDto recetaDto;
  final String imagePath;

  const AgregarReceta(this.recetaDto, this.imagePath);

  @override
  List<Object> get props => [];
}
