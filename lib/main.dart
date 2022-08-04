import 'dart:core';

import 'package:flutter/material.dart';

import 'screens/dashboard.dart';
import 'utils/color_palette.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: ColorPalette.primary,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: ColorPalette.secondary,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          appBarTheme: AppBarTheme(color: ColorPalette.primary),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: ColorPalette.secondary),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: ColorPalette.primary),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: ColorPalette.primary),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: ColorPalette.secondary,
              ),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: ColorPalette.secondary,
              selectionColor: ColorPalette.primary),
          textTheme: TextTheme()),
      home: const Dashboard(),
    );
  }
}
