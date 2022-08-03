import 'dart:core';

import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

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
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.blueAccent[700],
        //     textStyle: const TextStyle(color: Colors.white),
        //   ),
        // ),
        appBarTheme: AppBarTheme(color: Colors.green[900]),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
        // floatingActionButtonTheme:
        //     FloatingActionButtonThemeData(backgroundColor: Colors.green[900]),
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   secondary: Colors.blueAccent[700],
        // ),
      ),
      home: const Dashboard(),
    );
  }
}
