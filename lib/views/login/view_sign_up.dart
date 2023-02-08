import 'dart:developer';
import 'package:example_financy/components/components.dart';
import 'package:example_financy/constant.dart';
import 'package:example_financy/validator/validator.dart';
import 'package:example_financy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ViewSignUp extends StatefulWidget {
  const ViewSignUp({Key? key}) : super(key: key);

  @override
  State<ViewSignUp> createState() => _ViewSignUpState();
}

class _ViewSignUpState extends State<ViewSignUp> with Validator {

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  Widget _sizedBox({double? height}) => SizedBox(height: height ?? 14.0);

  Widget _form() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ComponentTextFormField(
                  labelText: "Your Name",
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  keyboard: TextInputType.name,
                  validator: (value) => validatorName(value)
              ),
              _sizedBox(),
              ComponentTextFormField(
                  labelText: "Your Email",
                  controller: _emailController,
                  keyboard: TextInputType.emailAddress,
                  validator: (value) => validatorEmail(value)
              ),
              _sizedBox(),
              ComponentTextFormField(
                  labelText: "Choose Your Password",
                  helperText: "Must have at least 8 characters, 1 capital letter and 1 number",
                  controller: _passwordController,
                  password: true,
                  validator: (value) {
                    _passwordController.text = value!;

                    if(_passwordController.text != null && _passwordController.text.isEmpty) {
                      return "O campo não pode ser nulo";

                    } else if(_passwordController.text != null && _passwordController.text.length <= 4) {
                      return "O campo está incorreto";

                    }
                    return null;
                  }
              ),
              _sizedBox(),
              ComponentTextFormField(
                  labelText: "Confirm Your Password",
                  helperText: "Must have at least 8 characters, 1 capital letter and 1 number",
                  controller: _confirmPasswordController,
                  password: true,
                  validator: (value) {
                    _confirmPasswordController.text = value!;

                    if(_confirmPasswordController.text != _passwordController.text) {
                      return "Os campos de senha estao errados";
                    }
                    return null;
                  }
              ),

            ],
    ),
        ));
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0,),
              const ComponentText(text: "Spend Smarter"),
              const ComponentText(text: "Save More"),
              Image.asset(Constant.assetImageSign),
             _form(),
              const SizedBox(height: 10.0,),
              ComponentButton(onTap: () => _registerForm(), text: "Sign Up"),
              WidgetTextButton(text: "Log in", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }

  void _registerForm() {

    if(_formKey.currentState!.validate()) {
      log('OK');

    }
  }
}
