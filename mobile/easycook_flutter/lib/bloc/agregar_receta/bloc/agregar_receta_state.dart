part of 'agregar_receta_bloc.dart';

abstract class AgregarRecetaState extends Equatable {
  const AgregarRecetaState();

  @override
  List<Object> get props => [];
}

class AgregarRecetaInitial extends AgregarRecetaState {}

class AgregarRecetaLoadingState extends AgregarRecetaState {}

class AgregarRecetaSuccessState extends AgregarRecetaState {
  final Recetas recetas;

  const AgregarRecetaSuccessState(this.recetas);

  @override
  List<Object> get props => [recetas];
}

class RecetaCreateError extends AgregarRecetaState {
  final String message;

  const RecetaCreateError(this.message);

  @override
  List<Object> get props => [message];
}
