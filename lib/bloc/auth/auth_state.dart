import 'package:equatable/equatable.dart';
import 'package:example_financy/models/models.dart';

abstract class AuthState extends Equatable {

  @override
  List<Object> get props => [];

}

class AuthLoadingState extends AuthState {}

class Authenticated extends AuthState {

  final UserModel userModel;
  final String message;
  Authenticated({required this.userModel, required this.message});
}

class UnAuthenticated extends AuthState {}

class AuthErrorState extends AuthState {

  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}

class SignInViewState extends AuthState {}

class SignUpViewState extends AuthState {}



