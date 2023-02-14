import 'dart:developer';

import 'package:example_financy/components/components.dart';
import 'package:example_financy/constant.dart';
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
          fontSize: fontSize ?? 36.0,
          fontWeight: weight ?? FontWeight.w700,
          color: const Color(0xFF438883)
        ),
    );
  }

  Widget _body(AuthBloc bloc) {
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
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
  }

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
            // userModel = state.userModel;
            return const ViewHome();

          } else if(state is AuthLoadingState) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));

          } else if(state is SignInViewState) {
            return const ViewSignIn();

          } else if(state is SignUpViewState) {
            return const ViewSignUp();

          }

          return _body(bloc);
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

