part of 'fondoimagen_bloc.dart';

abstract class FondoimagenState extends Equatable {
  const FondoimagenState();

  @override
  List<Object> get props => [];
}

class FondoimagenInitial extends FondoimagenState {}

class FondoSelectedSuccessState extends FondoimagenState {
  final XFile pickedFile2;

  const FondoSelectedSuccessState(this.pickedFile2);

  @override
  List<Object> get props => [pickedFile2];
}

class FondoSelectedErrorState extends FondoimagenState {
  final String message;

  const FondoSelectedErrorState(this.message);

  @override
  List<Object> get props => [message];
}
