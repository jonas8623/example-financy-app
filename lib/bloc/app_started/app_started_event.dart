import 'package:equatable/equatable.dart';

abstract class AppStartedEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class AppInitialEvent extends AppStartedEvent {}

class SignOut extends AppStartedEvent {}