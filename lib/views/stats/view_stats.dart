import 'package:flutter/material.dart';

class ViewStats extends StatefulWidget {
  const ViewStats({Key? key}) : super(key: key);

  @override
  State<ViewStats> createState() => _ViewStatsState();
}

class _ViewStatsState extends State<ViewStats> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Stats"),),
    );
  }
}
