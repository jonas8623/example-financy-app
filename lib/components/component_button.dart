import 'package:flutter/material.dart';

import '../constant.dart';

class ComponentButton extends StatelessWidget {

  final GestureTapCallback onTap;
  final String text;

  const ComponentButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Constant.color1,
                Constant.color2,
              ]
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
