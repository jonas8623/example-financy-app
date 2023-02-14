import 'package:equatable/equatable.dart';

abstract class AppStartedState extends Equatable {

  @override
  List<Object> get props => [];

}

class AppInitialState extends AppStartedState {}

class AppSuccessState extends AppStartedState {}

class AppErrorState extends AppStartedState {}

class Loading extends AppStartedState {}