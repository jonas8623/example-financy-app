import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:example_financy/bloc/bloc.dart';

class NetworkService {

  static void observeNetwork() async {

    Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if(connectivityResult == ConnectivityResult.none) {
        NetworkConnectionBloc().add(NotifyNetworkConnection());
      } else {
        NetworkConnectionBloc().add(NotifyNetworkConnection(isConnected: true));
      }
    });
  }
}