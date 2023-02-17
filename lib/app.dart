import 'package:flutter/material.dart';
import 'app/app_starter.dart';

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
        home: const App(),
    );
  }
}