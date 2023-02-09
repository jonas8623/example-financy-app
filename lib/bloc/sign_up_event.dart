

import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class SignUpInitialViewEvent extends SignUpEvent {}

class SignUpRequiredEvent extends SignUpEvent {

  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;

  SignUpRequiredEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword
  });

  @override
  List<Object> get props => [name!, email!, password!, confirmPassword!];
}