import 'package:example_financy/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpInitialViewEvent>((event, emit) => emit(SignUpViewRegisterState()));
    on<SignUpRequiredEvent>((event, emit) => _signUp(event, emit));
  }

  Future<void> _signUp(SignUpRequiredEvent event, Emitter<SignUpState> emit) async {

    emit(SignUpLoadingState());

    try {
      if(event.name != null && event.email != null && event.password != null && event.confirmPassword != null) {
        emit(SignUpSuccessState());

      } else {
        emit(SignUpErrorState(message: "Ops, algo aconteceu de errado"));
      }
    } catch(error) {
      emit(SignUpErrorState(message: "Ops, algo aconteceu de errado: $error"));
    }
  }

}