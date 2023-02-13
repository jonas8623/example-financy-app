import 'package:example_financy/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/secure_storage_service.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {

  final SecureStorageService storageService;

  StorageBloc(this.storageService) : super(StorageInitialState()) {

    on<StorageInitialEvent>((event, emit) => _isUserLogged(event, emit));
  }

  Future<void> _isUserLogged(StorageInitialEvent event, Emitter<StorageState> emit) async {

    emit(Loading());

    try {
      final result = await storageService.readOne(key: "CURRENT_USER");

      if(result != null) {
        emit(StorageSuccessState());
      } else {
        emit(StorageInitialState());
      }
    } catch(error) {
      emit(StorageErrorState());
    }

  }



}