import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {

  @override
  List<Object> get props => [];
}

class SignUpViewRegisterState extends SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {

  final String message;
  SignUpErrorState({required this.message});
}
