import 'package:flutter/material.dart';

class WidgetTextButton extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String title;
  final String textButton;

  const WidgetTextButton({Key? key, required this.title, required this.textButton, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF438883)
              ),
            )
        )
      ],
    );
  }
}
