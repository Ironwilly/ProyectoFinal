part of 'recetas_bloc.dart';

abstract class RecetasState extends Equatable {
  const RecetasState();

  @override
  List<Object> get props => [];
}

class RecetasInitial extends RecetasState {}

class RecetasFetched extends RecetasState {
  final List<Receta> receta;
  final String type;

  const RecetasFetched(this.receta, this.type);

  @override
  List<Object> get props => [receta];
}

class RecetaFetchError extends RecetasState {
  final String message;
  const RecetaFetchError(this.message);

  @override
  List<Object> get props => [message];
}

class RecetaCreated extends RecetasState {
  final Receta response;

  const RecetaCreated(this.response);

  @override
  List<Object> get props => [response];
}
