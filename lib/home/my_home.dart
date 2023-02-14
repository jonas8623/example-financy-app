import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../views/views.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AppStartedBloc>(context);

    return BlocBuilder<AppStartedBloc, AppStartedState>(
        bloc: bloc,
        builder: (context, state) {

          if(state is AppSuccessState) {
            // userModel = state.userModel;
            return const ViewHome();

          } else if(state is Loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()));

          }

          return const ViewOnBoarding();
        }
    );
  }
}
