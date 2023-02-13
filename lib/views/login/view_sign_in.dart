import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant.dart';
import '../../widgets/widgets.dart';

class ViewSignIn extends StatefulWidget {
  const ViewSignIn({Key? key}) : super(key: key);

  @override
  State<ViewSignIn> createState() => _ViewSignInState();
}

class _ViewSignInState extends State<ViewSignIn> {

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  Widget _sizedBox({double? height}) => SizedBox(height: height ?? 14.0);

  Widget _form() {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ComponentTextFormField(
                    labelText: "Your Email",
                    controller: _emailController,
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {

                      _emailController.text = value!;

                      if(_emailController.text.isEmpty) {
                        return "O campo não pode ser nulo";
                      }
                      return null;
                    }
                ),
                _sizedBox(height: 22.0),
                ComponentTextFormField(
                    labelText: "Your Password",
                    controller: _passwordController,
                    password: true,
                    validator: (value) {
                      _passwordController.text = value!;

                      if(_passwordController.text.isEmpty) {
                        return "O campo não pode ser nulo";

                      } else if(_passwordController.text.length <= 4) {
                        return "O campo está incorreto";

                      }
                      return null;
                    }
                ),
              ],
            ),
        )
    );
  }

  Widget _body(AuthBloc bloc) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _sizedBox(height: 18.0),
                const ComponentText(text: "Spend Smarter"),
                const ComponentText(text: "Save More"),
                _sizedBox(height: 22.0),
                Image.asset(Constant.assetImageSignIn),
                _sizedBox(),
                _form(),
                _sizedBox(),
                ComponentButton(onTap: () => _registerForm(bloc), text: "Sign In"),
                WidgetTextButton(title: "Already Have Account?", textButton: "Sign Up", onPressed: () => bloc.add(SignUpViewEvent()))
              ],
            ),
          )
      ),
    ); 
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return _body(bloc);
        }
    );
  }

  void _registerForm(AuthBloc bloc) {

    if(_formKey.currentState!.validate()) {

      bloc.add(SignInRequestedEvent(
        // name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        // confirmPassword: _confirmPasswordController.text
      ));
    }
  }
}
