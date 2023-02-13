import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/services/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/services.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthServiceHelper authServiceHelper;

  AuthBloc({required this.authServiceHelper}) : super(UnAuthenticated()) {


    on<SignInRequestedEvent>((event, emit) => _signIn(event, emit));
    on<SignUpRequestedEvent>((event, emit) => _signUp(event, emit));
    on<SignOut>((event, emit) => _signOut(event, emit));
    on<SignInViewEvent>((event, emit) => emit(SignInViewState()));
    on<SignUpViewEvent>((event, emit) => emit(SignUpViewState()));
  }

  Future<void> _signIn(SignInRequestedEvent event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      final user = await authServiceHelper.signIn(email: event.email, password: event.password);

      if(user != null) {
        emit(Authenticated(userModel: user));
      } else {
        emit(AuthErrorState(errorMessage: "Ops, aconteceu algum erro ao se logar"));
      }
    } catch(error) {
      emit(AuthErrorState(errorMessage: "Ops, aconteceu algum erro ao se logar: $error"));
      emit(UnAuthenticated());
    }
  }

  Future<void> _signUp(SignUpRequestedEvent event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      const secureStorage = SecureStorageService();
      final user = await authServiceHelper.signUp(
          name: event.name,
          email: event.email,
          password: event.password
      );

      if(user != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        emit(Authenticated(userModel: user));
      } else {
        emit(AuthErrorState(errorMessage: "Ops, aconteceu algum erro ao se cadastrar"));
      }
    } catch(error) {
      emit(AuthErrorState(errorMessage: "Ops, aconteceu algum erro ao se cadastrar: $error"));
      emit(UnAuthenticated());
    }
  }

  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      await authServiceHelper.signOut();
      emit(UnAuthenticated());
    } catch(error) {
      emit(AuthErrorState(errorMessage: "Ops aconteceu algo ao sair: $error"));
    }
  }
}