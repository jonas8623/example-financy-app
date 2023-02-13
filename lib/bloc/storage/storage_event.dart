import 'package:equatable/equatable.dart';

abstract class StorageEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class StorageInitialEvent extends StorageEvent {}

