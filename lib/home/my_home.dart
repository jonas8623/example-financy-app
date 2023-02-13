import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../models/models.dart';
import '../views/views.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  late final UserModel userModel;

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocConsumer<AuthBloc, AuthState>(
        bloc: bloc,
        listener: (context, state) {
          if(state is AuthErrorState) {
            _message(message: state.errorMessage, checkMessage: 2);
          }
        },
        builder: (context, state) {

          if(state is Authenticated) {
            userModel = state.userModel;
            return const ViewHome();

          } else if(state is AuthLoadingState) {
            return const Scaffold(body: Center(child: CircularProgressIndicator(),),);

          } else if(state is SignInViewState) {
            return const ViewSignIn();

          } else if(state is SignUpViewState) {
            return const ViewSignUp();

          }

          return const ViewOnBoarding();
        }
    );
  }

  void _message({required String message, int checkMessage = 1}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: checkMessage != 1 ? Colors.redAccent : Theme.of(context).primaryColor,
        ));
  }
}
