import 'package:equatable/equatable.dart';

abstract class NetworkConnectionEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class ObserveNetworkConnection extends NetworkConnectionEvent {}

class NotifyNetworkConnection extends NetworkConnectionEvent {

  final bool isConnected;

  NotifyNetworkConnection({this.isConnected = false});
}

