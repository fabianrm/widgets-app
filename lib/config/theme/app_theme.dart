import 'package:flutter/material.dart';

//const List<Color> colorList = [Colors.blue, Colors.red ];

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.pinkAccent,
  Colors.black
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Seleccione un color mayor a 0 '),
        assert(selectedColor < colorList.length,
            'Indice de color no se encuentra en el rango ${colorList.length - 1} ');

  //Método para obtener el tema
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
      );
}
