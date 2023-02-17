import 'package:equatable/equatable.dart';

abstract class NetworkConnectionState extends Equatable {

  @override
  List<Object> get props => [];

}

class InitialNetworkConnectionState extends NetworkConnectionState {}

class LoadingNetworkConnectionState extends NetworkConnectionState {}

class SuccessNetworkConnectionState extends NetworkConnectionState {}

class FailureNetworkConnectionState extends NetworkConnectionState {

  final String message;
  FailureNetworkConnectionState({required this.message});
}