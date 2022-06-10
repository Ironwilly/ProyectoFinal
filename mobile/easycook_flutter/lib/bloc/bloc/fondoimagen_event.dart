part of 'fondoimagen_bloc.dart';

abstract class FondoimagenEvent extends Equatable {
  const FondoimagenEvent();

  @override
  List<Object> get props => [];
}

class SelectFondoimagenEvent extends FondoimagenEvent {
  final ImageSource source2;

  const SelectFondoimagenEvent(this.source2);

  @override
  List<Object> get props => [source2];
}
