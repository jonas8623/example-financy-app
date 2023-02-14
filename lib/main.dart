import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/firebase_options.dart';
import 'package:example_financy/services/secure_storage_service.dart';
import 'package:example_financy/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    RepositoryProvider(
      create: (context) => AuthServiceImplement(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<AppStartedBloc>(
                create: (context) => AppStartedBloc(const SecureStorageService())..add(AppInitialEvent())),
            BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(
                    authServiceHelper: AuthServiceImplement()))
          ],
          child: const MyApp()),
    )
  );
}



