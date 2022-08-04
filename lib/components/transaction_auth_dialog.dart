import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;
  final Function() onCancel;

  const TransactionAuthDialog(
      {Key? key, required this.onConfirm, required this.onCancel})
      : super(key: key);

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Authenticate'),
      content: TextField(
        controller: _passController,
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        style: const TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_passController.text);
            Navigator.pop(context);
          },
          child: Text(
            'Confirm',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
