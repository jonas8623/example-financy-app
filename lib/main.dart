import 'package:example_financy/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<SignUpBloc>(create: (context) => SignUpBloc())
        ],
        child: const MyApp())
  );
}



