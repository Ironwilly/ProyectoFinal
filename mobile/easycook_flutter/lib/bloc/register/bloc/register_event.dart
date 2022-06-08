part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class DoRegisterEvent extends RegisterEvent {
  final RegisterDto registerDto;
  final String avatar;
  final String fondo;

  const DoRegisterEvent(this.registerDto, this.avatar, this.fondo);
}
