import 'package:equatable/equatable.dart';

abstract class StorageState extends Equatable {

  @override
  List<Object> get props => [];

}

class StorageInitialState extends StorageState {}

class StorageSuccessState extends StorageState {}

class StorageErrorState extends StorageState {}

class Loading extends StorageState {}