import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSplash extends StatefulWidget {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  State<ViewSplash> createState() => _ViewSplashState();
}

class _ViewSplashState extends State<ViewSplash> {


  // @override
  // void initState() {
  //   Future.delayed(const Duration(milliseconds: 3));
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const ViewOnBoarding()));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Constant.color1,
                        Constant.color2,
                      ]
                  )
              ),
              child: const Text(
                "Finance",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),
              ),
            ),
          );
        }
    );
  }
}
