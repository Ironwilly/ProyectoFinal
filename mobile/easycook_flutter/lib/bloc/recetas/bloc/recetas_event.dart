part of 'recetas_bloc.dart';

abstract class RecetasEvent extends Equatable {
  const RecetasEvent();

  @override
  List<Object> get props => [];
}

class FetchReceta extends RecetasEvent {
  final String type;

  const FetchReceta(this.type);

  @override
  List<Object> get props => [];
}

class CreateRecetaEvent extends RecetasEvent {
  final RecetaDto recetaDto;
  final String imagePath;

  const CreateRecetaEvent(this.recetaDto, this.imagePath);

  @override
  List<Object> get props => [recetaDto];
}
