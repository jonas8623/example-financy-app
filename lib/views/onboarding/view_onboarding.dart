import 'package:example_financy/components/components.dart';
import 'package:example_financy/constant.dart';
import 'package:example_financy/extensions/extensions.dart';
import 'package:example_financy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';
import '../../models/models.dart';
import '../views.dart';

class ViewOnBoarding extends StatefulWidget {
  const ViewOnBoarding({Key? key}) : super(key: key);

  @override
  State<ViewOnBoarding> createState() => _ViewOnBoardingState();
}

class _ViewOnBoardingState extends State<ViewOnBoarding> {

  late final UserModel userModel;

  Widget _expanded({int? flex, required Color color, Widget? child}) {
    return Expanded(
        flex: flex ?? 2,
        child: Container(
          color: color,
          child: child,
        ),
    );
  }

  Widget _text({required String text, double? fontSize, FontWeight? weight}) {
    return Text(
        text,
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: fontSize ?? 36.getDeviceWidth,
          fontWeight: weight ?? FontWeight.w700,
          color: const Color(0xFF438883)
        ),
    );
  }

  Widget _loading() {
    return const Scaffold(
        body: Center(child: CircularProgressIndicator()));
  }

  Widget _body(AuthBloc bloc) {
    return BlocConsumer<NetworkConnectionBloc, NetworkConnectionState>(
        listener: (context, state) {
          if(state is FailureNetworkConnectionState) {
            _failureNetwork(
                context, title: "Connection To The Network",
                message: state.message
            );
          }
        },
        builder: (context, state) {
          if(state is LoadingNetworkConnectionState) {
            _loading();
          }

          return Scaffold(
            body: Column(
              children: [
                _expanded(
                    color: const Color(0xFFEEF8F7),
                    child: Image.asset(Constant.assetImageFinance)),
                _expanded(
                    color: Colors.white,
                    flex: 1,
                    child: Align(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.getDeviceHeight),
                        child: Column(
                          children: [
                            _text(text: "Spend Smarter"),
                            _text(text: "Save More"),
                            ComponentButton(onTap: () => bloc.add(SignInViewEvent()), text: "Get Started"),
                            WidgetTextButton(title: "Already Have Account?", textButton: "Sign Up", onPressed: () => bloc.add(SignUpViewEvent()))
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {

    final authBloc = BlocProvider.of<AuthBloc>(context);
    final networkBloc = BlocProvider.of<NetworkConnectionBloc>(context);

    return BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if(state is AuthErrorState) {
            _message(message: state.errorMessage, checkMessage: 2);
          } else if(state is Authenticated) {
            _message(message: state.message);
          }
        },
        builder: (context, state) {

          if(state is Authenticated) {
            return const View();

          } else if(state is AuthLoadingState) {
            _loading();

          } else if(state is SignInViewState) {
            return const ViewSignIn();

          } else if(state is SignUpViewState) {
            return const ViewSignUp();

          }

          return _body(authBloc);
        }
    );
  }

  void _message({required String message, int checkMessage = 1}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: checkMessage != 1
              ? Colors.redAccent
              : Theme.of(context).primaryColor,
        ));
  }

  Widget _textButton({required GestureTapCallback onPressed, required String text}) => TextButton(
      onPressed: onPressed,
      child: Text(text));

  void _failureNetwork(BuildContext context, {required String title, required String message}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            _textButton(onPressed: () => Navigator.pop(context), text: "Ok"),
          ],
        )
    );
  }
}

