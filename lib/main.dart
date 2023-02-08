import 'package:example_financy/views/views.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF438883),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF438883))
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF438883))
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF438883))
          ),
        )
      ),
      home: const ViewSignUp()
    );
  }
}

