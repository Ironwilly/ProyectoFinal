part of 'fondoimagen_bloc.dart';

abstract class FondoimagenState extends Equatable {
  const FondoimagenState();

  @override
  List<Object> get props => [];
}

class FondoimagenInitial extends FondoimagenState {}

class FondoSelectedSuccessState extends FondoimagenState {
  final XFile pickedFile;

  const FondoSelectedSuccessState(this.pickedFile);

  @override
  List<Object> get props => [pickedFile];
}

class FondoSelectedErrorState extends FondoimagenState {
  final String message;

  const FondoSelectedErrorState(this.message);

  @override
  List<Object> get props => [message];
}
