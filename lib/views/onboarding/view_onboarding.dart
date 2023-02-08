import 'package:example_financy/components/components.dart';
import 'package:example_financy/constant.dart';
import 'package:example_financy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ViewOnBoarding extends StatelessWidget {
  const ViewOnBoarding({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _expanded(
              color: const Color(0xFFEEF8F7),
              child: Image.asset(Constant.assetImageFinance),
          ),
          _expanded(
              color: Colors.white,
              flex: 1,
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      _text(text: "Spend Smarter"),
                      _text(text: "Save More"),
                      ComponentButton(onTap: () {}, text: "Get Started"),
                      WidgetTextButton(text: "Log In", onPressed: () {})
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
