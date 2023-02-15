import 'package:flutter/material.dart';

class BottomAppBarModel {

  final String? label;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final GestureTapCallback? onPressed;

  BottomAppBarModel({
    this.label,
    this.firstIcon,
    this.secondIcon,
    this.onPressed
  });

  BottomAppBarModel.empty({
    this.label,
    this.firstIcon,
    this.secondIcon,
    this.onPressed
  });

  @override
  String toString() {
    return 'BottomAppBarModel{label: $label, firstIcon: $firstIcon, secondIcon: $secondIcon, onPressed: $onPressed}';
  }
}