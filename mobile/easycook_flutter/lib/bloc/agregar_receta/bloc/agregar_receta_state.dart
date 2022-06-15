part of 'agregar_receta_bloc.dart';

abstract class AgregarRecetaState extends Equatable {
  const AgregarRecetaState();

  @override
  List<Object> get props => [];
}

class AgregarRecetaInitial extends AgregarRecetaState {}

class AgregarRecetaLoadingState extends AgregarRecetaState {}

class AgregarRecetaSuccessState extends AgregarRecetaState {
  final Receta receta;

  const AgregarRecetaSuccessState(this.receta);

  @override
  List<Object> get props => [receta];
}

class RecetaCreateError extends AgregarRecetaState {
  final String message;

  const RecetaCreateError(this.message);

  @override
  List<Object> get props => [message];
}
