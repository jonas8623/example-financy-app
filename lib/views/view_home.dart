import 'package:example_financy/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {

          if(state is Authenticated) {

          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("User Authenticated:"),
                  ElevatedButton(
                      onPressed: () {


                        if(state is Authenticated) {
                          bloc.add(SignOutEvent());
                        } else {
                          BlocProvider.of<AppStartedBloc>(context).add(SignOut());
                        }
                      }, child: const Text("Logout"))
                ],
              ),),);
        }
    );
  }
}