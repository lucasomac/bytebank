import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;

  const Progress(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 16),
              ),
            )
          ]),
    );
  }
}
