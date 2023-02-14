import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/secure_storage_service.dart';

class AppStartedBloc extends Bloc<AppStartedEvent, AppStartedState> {

  final SecureStorageService storageService;

  AppStartedBloc(this.storageService) : super(AppInitialState()) {

    on<AppInitialEvent>((event, emit) => _isUserLogged(event, emit));
    on<SignOut>((event, emit) => _logoutUser(event, emit));

  }

  Future<void> _isUserLogged(AppInitialEvent event, Emitter<AppStartedState> emit) async {

    emit(Loading());

    try {
      final result = await storageService.readOne(key: "CURRENT_USER");

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

      await AuthServiceImplement().signOut();
      await storageService.deleteOne(key: "CURRENT_USER");
      emit(AppInitialState());

    } catch(error) {
      emit(AppErrorState());
    }
  }
}