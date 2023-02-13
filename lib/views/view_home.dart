import 'package:example_financy/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {

  // late final UserModel userModel;

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {

        if(state is Authenticated) {
          // userModel = state.userModel;
        }

      return const Scaffold(
        body: Center(
          child: Text("User Authenticated: "),),);
        }
    );
  }
}