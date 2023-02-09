import 'package:flutter/material.dart';

class ComponentTextFormField extends StatefulWidget {

  final String labelText;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextCapitalization? textCapitalization;
  final bool? password;
  final String? helperText;

  const ComponentTextFormField({
    Key? key,
    required this.labelText,
    this.keyboard,
    this.validator,
    required this.controller,
    this.textCapitalization,
    this.password = false,
    this.helperText
  }) : super(key: key);

  @override
  State<ComponentTextFormField> createState() => _ComponentTextFormFieldState();
}

class _ComponentTextFormFieldState extends State<ComponentTextFormField> {

  bool _obscureText = true;
  String? _helperTextLocal;

  final _outlineBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF438883),
    )
  );

  @override
  void initState() {
    _helperTextLocal = widget.helperText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      obscureText: widget.password! ? _obscureText : false,
      textInputAction: TextInputAction.next,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      onChanged: (value) {
        if(value.isNotEmpty) {
          setState(() {
            _helperTextLocal = null;
          });
        } else if(value.isEmpty) {
          setState(() {
            _helperTextLocal = widget.helperText;
          });
        }
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey[600]),
        labelText: widget.labelText,
        helperText: _helperTextLocal,
        helperMaxLines: 3,
        enabledBorder: _outlineBorder,
        focusedBorder: _outlineBorder,
        // errorBorder: _outlineBorder,
        border: _outlineBorder,
        suffixIcon: widget.password!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText
                        ? Icons.visibility
                        : Icons.visibility_off
                ))
            : null
      ),
      validator: widget.validator,
    );
  }
}
