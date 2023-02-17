import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkConnectionBloc extends Bloc<NetworkConnectionEvent, NetworkConnectionState> {

  NetworkConnectionBloc._() : super(InitialNetworkConnectionState()) {

    on<ObserveNetworkConnection>((event, emit) => _observe(event, emit));
    on<NotifyNetworkConnection>((event, emit) => _notifyStatus(event, emit));
  }

  static final NetworkConnectionBloc _instance = NetworkConnectionBloc._();
  factory NetworkConnectionBloc() => _instance;

  void _observe(event, emit) {
    return NetworkService.observeNetwork();
  }

  void _notifyStatus(NotifyNetworkConnection event, emit) {

    emit(LoadingNetworkConnectionState());
    event.isConnected
        ? emit(SuccessNetworkConnectionState())
        : emit(FailureNetworkConnectionState(message: "No connection to the network"));
  }
}