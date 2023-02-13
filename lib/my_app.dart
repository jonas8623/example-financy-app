import 'package:example_financy/home/my_home.dart';
import 'package:example_financy/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: const Color(0xFF438883),
        ),
        home: const MyHome(),
    );
  }
}