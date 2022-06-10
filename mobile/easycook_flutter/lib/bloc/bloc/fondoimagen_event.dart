part of 'fondoimagen_bloc.dart';

abstract class FondoimagenEvent extends Equatable {
  const FondoimagenEvent();

  @override
  List<Object> get props => [];
}

class SelectFondoimagenEvent extends FondoimagenEvent {
  final ImageSource source;

  const SelectFondoimagenEvent(this.source);

  @override
  List<Object> get props => [source];
}
