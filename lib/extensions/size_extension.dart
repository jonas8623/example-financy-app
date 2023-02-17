import 'package:flutter/material.dart';

class DeviceSizeData {

  DeviceSizeData._();

  double _width = 0;
  double _height = 0;

  static const Size _designSize = Size(414.0, 896.0);

  static final DeviceSizeData _instance = DeviceSizeData._();
  factory DeviceSizeData() => _instance;

  double get getWidth => _width;
  double get getHeight => _height;

  // Metodo de configuração inicial
  static void init(BuildContext context, {Size designSizeParameter = _designSize}) {

    // Verifica se existe dados de MediaQuery
    final deviceData = MediaQuery.maybeOf(context);

    // Caso não exista, recebe o valor inicial do protótipo
    final deviceSize = deviceData?.size ?? _designSize;

    _instance._width = deviceSize.width;
    _instance._height = deviceSize.height;
  }
}

extension SizeExtension on num {

  /*
    Calcula o valor proporcional baseado na largura/altura do dispositivo,
    baseado em relação ao protótipo
  */

  double get getDeviceWidth =>
      (this * DeviceSizeData._instance._width) / DeviceSizeData._designSize.width;

  double get getDeviceHeight =>
      (this * DeviceSizeData._instance._height) / DeviceSizeData._designSize.height;



}