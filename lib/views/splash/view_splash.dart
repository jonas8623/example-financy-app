import 'package:example_financy/constant.dart';
import 'package:flutter/material.dart';

class ViewSplash extends StatelessWidget {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Constant.colorLinear1,
                Constant.colorLinear2,
              ]
          )
        ),
        child: const Text(
          "Finance",
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
