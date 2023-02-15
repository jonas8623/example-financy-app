import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/repositories.dart';

class AppStartedBloc extends Bloc<AppStartedEvent, AppStartedState> {

  final SecureStorageRepository storage;
  final AuthServiceHelper authServiceHelper;

  AppStartedBloc(this.storage, this.authServiceHelper) : super(AppInitialState()) {

    on<AppInitialEvent>((event, emit) => _isUserLogged(event, emit));
    on<SignOut>((event, emit) => _logoutUser(event, emit));

  }

  Future<void> _isUserLogged(AppInitialEvent event, Emitter<AppStartedState> emit) async {

    emit(Loading());

    try {
      final result = await storage.readOne(key: "CURRENT_USER");

      if(result != null) {
        emit(AppSuccessState());
      } else {
        emit(AppInitialState());
      }
    } catch(error) {
      emit(AppErrorState());
    }

  }

  Future<void> _logoutUser(SignOut event, Emitter<AppStartedState> emit) async {

    emit(Loading());

    try {

      await authServiceHelper.signOut();
      await storage.deleteOne(key: "CURRENT_USER");
      emit(AppInitialState());

    } catch(error) {
      emit(AppErrorState());
    }
  }
}