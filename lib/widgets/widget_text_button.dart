import 'package:flutter/material.dart';

class WidgetTextButton extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;

  const WidgetTextButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have account?"),
        TextButton(
            onPressed: onPressed,
            child: Text(
              text,
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
