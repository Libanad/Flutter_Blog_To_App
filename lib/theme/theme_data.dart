import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.grey[200],
    fontFamily: 'Opensans',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'OpenSans',
        backgroundColor: Colors.orange,
        
        ),
      ),
    ),
  );
  
}