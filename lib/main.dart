import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/firebase_options.dart';
import 'package:example_financy/repositories/repositories.dart';
import 'package:example_financy/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    RepositoryProvider(
      create: (context) => AuthServiceImplement(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<AppStartedBloc>(
                create: (context) => AppStartedBloc(
                    const SecureStorageRepository(),
                    AuthServiceImplement())..add(AppInitialEvent())),
            BlocProvider<NetworkConnectionBloc>(
                create: (context) => NetworkConnectionBloc()..add(ObserveNetworkConnection()
                )),
            BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(
                    authServiceHelper: AuthServiceImplement(),
                    secureStorageRepository: const SecureStorageRepository()
                )),
            BlocProvider<TransactionBloc>(
                create: (context) => TransactionBloc(
                    transactionRepository: TransactionRepositoryImplement()
                )..add(LoadTransactionEvent()))
          ],
          child: const MyApp()),
    )
  );
}



