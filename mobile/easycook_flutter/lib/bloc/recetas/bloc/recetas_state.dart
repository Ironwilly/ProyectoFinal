part of 'recetas_bloc.dart';

abstract class RecetasState extends Equatable {
  const RecetasState();

  @override
  List<Object> get props => [];
}

class RecetasInitial extends RecetasState {}

class RecetasFetched extends RecetasState {
  final List<Recetas> recetas;
  final String type;

  const RecetasFetched(this.recetas, this.type);

  @override
  List<Object> get props => [recetas];
}

class RecetaFetchError extends RecetasState {
  final String message;
  const RecetaFetchError(this.message);

  @override
  List<Object> get props => [message];
}
