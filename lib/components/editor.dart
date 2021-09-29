import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData? iconData;

  const Editor({
    required this.rotulo,
    required this.dica,
    required this.controller,
    required this.inputType,
    this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        keyboardType: inputType,
        decoration: InputDecoration(
            // border: OutlineInputBorder(),
            labelText: rotulo,
            hintText: dica,
            icon: iconData != null ? Icon(iconData) : null),
      ),
    );
  }
}
