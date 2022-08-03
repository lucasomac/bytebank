import 'package:flutter/material.dart';

import '../models/transfer.dart';
import 'editor.dart';

const _titleAppBar = 'Creating transfer';
const _buttonTextSave = 'Save';

class TransferForm extends StatefulWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();

  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                label: 'Account Number',
                tip: '13',
                controller: _controllerAccountNumber,
                inputType: TextInputType.number),
            Editor(
                label: 'Valor',
                tip: '10.00',
                controller: _controllerValor,
                inputType: const TextInputType.numberWithOptions(decimal: true),
                iconData: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _createTransfer(context),
              child: const Text(_buttonTextSave),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final Transfer transfer = Transfer(double.parse(_controllerValor.text),
        int.parse(_controllerAccountNumber.text));
    Navigator.pop(context, transfer);
  }
}
