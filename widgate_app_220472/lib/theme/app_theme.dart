import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.purple,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.pinkAccent,
  Colors.pink,
  Colors.grey
];


class AppTheme {
  final int selectedColor;
  
  AppTheme({ this.selectedColor = 0})
  : assert( selectedColor>=0, 
  'La posicion del color seleccionado debe ser mayor a 0'),
  assert(selectedColor < colorList.length, 
  'La posicion del color seleccionado no debe ser superior al tamaño de la lista');

  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor]
  );
}

