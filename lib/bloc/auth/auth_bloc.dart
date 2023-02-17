import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/services.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthServiceHelper authServiceHelper;
  final SecureStorageRepository secureStorageRepository;

  AuthBloc({
    required this.authServiceHelper,
    required this.secureStorageRepository
  }) : super(UnAuthenticated()) {

    on<SignInRequestedEvent>((event, emit) => _signIn(event, emit));
    on<SignUpRequestedEvent>((event, emit) => _signUp(event, emit));
    on<SignOutEvent>((event, emit) => _signOut(event, emit));
    on<SignInViewEvent>((event, emit) => _navigateSignInView(event, emit));
    on<SignUpViewEvent>((event, emit) => _navigateSignUpView(event, emit));
  }

  Future<void> _signIn(SignInRequestedEvent event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      final user = await authServiceHelper.signIn(
          email: event.email,
          password: event.password
      );

      if(user != null) {
        await secureStorageRepository.write(key: "CURRENT_USER", value: user.toJson());
        emit(Authenticated(userModel: user, message: "Congratulations, you managed to register"));
      } else {
        emit(AuthErrorState(errorMessage: "Error when using login"));
      }
    } catch(error) {
      emit(AuthErrorState(errorMessage: "Error when using login: $error"));
      emit(UnAuthenticated());
    }
  }

  Future<void> _signUp(SignUpRequestedEvent event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      final user = await authServiceHelper.signUp(
          name: event.name,
          email: event.email,
          password: event.password
      );

      if(user != null) {
        await secureStorageRepository.write(key: "CURRENT_USER", value: user.toJson());
        emit(Authenticated(userModel: user, message: "Congratulations, you managed to register"));
      } else {
        emit(AuthErrorState(errorMessage: "Error when registering"));
      }
    } catch(error) {
      emit(AuthErrorState(errorMessage: "Error when registering: $error"));
      emit(UnAuthenticated());
    }
  }

  Future<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      await authServiceHelper.signOut();
      await secureStorageRepository.deleteOne(key: "CURRENT_USER");
      emit(UnAuthenticated());
    } catch(error) {
      emit(AuthErrorState(errorMessage: "Ops aconteceu algo ao sair: $error"));
    }
  }

  Future<void> _navigateSignInView(SignInViewEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    emit(SignInViewState());
  }

  Future<void> _navigateSignUpView(SignUpViewEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    // Future.delayed(const Duration(microseconds: 200));
    emit(SignUpViewState());
  }
}