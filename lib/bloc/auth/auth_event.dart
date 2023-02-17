import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class SignInRequestedEvent extends AuthEvent {

  final String email;
  final String password;

  SignInRequestedEvent({required this.email, required this.password});
}

class SignUpRequestedEvent extends AuthEvent {

  final String name;
  final String email;
  final String password;

  SignUpRequestedEvent({required this.name, required this.email, required this.password});
}

class SignOutEvent extends AuthEvent {}

class SignInViewEvent extends AuthEvent {}

class SignUpViewEvent extends AuthEvent {}