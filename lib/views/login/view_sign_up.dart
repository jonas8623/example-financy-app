import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/components/components.dart';
import 'package:example_financy/constant.dart';
import 'package:example_financy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSignUp extends StatefulWidget {
  const ViewSignUp({Key? key}) : super(key: key);

  @override
  State<ViewSignUp> createState() => _ViewSignUpState();
}

class _ViewSignUpState extends State<ViewSignUp> {

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
                  validator: (value) {

                    _nameController.text = value!;

                    if(_nameController.text.isEmpty) {
                      return "Field cannot be null";
                    }
                    return null;
                  }
              ),
              _sizedBox(),
              ComponentTextFormField(
                  labelText: "Your Email",
                  controller: _emailController,
                  keyboard: TextInputType.emailAddress,
                  validator: (value) {

                    _emailController.text = value!;

                    if(_emailController.text.isEmpty) {
                      return "Field cannot be null";
                    }
                    return null;
                  }
              ),
              _sizedBox(),
              ComponentTextFormField(
                  labelText: "Choose Your Password",
                  helperText: "Must have at least 8 characters, 1 capital letter and 1 number",
                  controller: _passwordController,
                  password: true,
                  validator: (value) {
                    _passwordController.text = value!;

                    if(_passwordController.text.isEmpty) {
                      return "Field cannot be null";

                    } else if(_passwordController.text.length <= 4) {
                      return "The field is incorrect";

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
                      return "Password fields are not identical";
                    }
                    return null;
                  }
              ),

            ],
    ),
        ));
  }

  Widget _body(AuthBloc bloc) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _sizedBox(height: 10.0),
              const ComponentText(text: "Spend Smarter"),
              const ComponentText(text: "Save More"),
              Image.asset(Constant.assetImageSignUp),
              _form(),
              _sizedBox(height: 10.0),
              ComponentButton(onTap: () => _registerForm(bloc), text: "Sign Up"),
              WidgetTextButton(title: "Access Your Account" ,textButton: "Sign in", onPressed: () => bloc.add(SignInViewEvent()))
            ],
          ),
        ),
      ),
    );
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

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) => _body(bloc));
  }

  void _registerForm(AuthBloc bloc) {

    if(_formKey.currentState!.validate()) {

      bloc.add(SignUpRequestedEvent(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
      ));
    }
  }
}
