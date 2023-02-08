import 'package:flutter/material.dart';

class ComponentText extends StatelessWidget {

  final String text;
  final double? fontSize;
  final FontWeight? weight;

  const ComponentText({
    Key? key,
    required this.text,
    this.fontSize,
    this.weight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
