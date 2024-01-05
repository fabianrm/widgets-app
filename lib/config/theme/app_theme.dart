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
  final bool isDarkmode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  })  : assert(selectedColor >= 0, 'Seleccione un color mayor a 0 '),
        assert(selectedColor < colorList.length,
            'Indice de color no se encuentra en el rango ${colorList.length - 1} ');

  //Método para obtener el tema y setear parametros iniciales
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );


//copia la instancia de la clase
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkmode,
  }) =>
      AppTheme(
          selectedColor: selectedColor ?? this.selectedColor,
          isDarkmode: isDarkmode ?? this.isDarkmode);
}
