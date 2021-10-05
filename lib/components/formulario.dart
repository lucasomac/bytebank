import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'editor.dart';

const _tituloAppBar = 'Criando Tranferência';
const _buttonTextSave = 'Salvar';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<FormularioTransferencia> createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerNumeroConta = TextEditingController();

  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                rotulo: 'Número da conta',
                dica: '13',
                controller: _controllerNumeroConta,
                inputType: TextInputType.number),
            Editor(
                rotulo: 'Valor',
                dica: '10.00',
                controller: _controllerValor,
                inputType: const TextInputType.numberWithOptions(decimal: true),
                iconData: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criaTranferencia(context),
              child: const Text(_buttonTextSave),
            )
          ],
        ),
      ),
    );
  }

  void _criaTranferencia(BuildContext context) {
    final Transferencia transferencia = Transferencia(
        double.parse(_controllerValor.text),
        int.parse(_controllerNumeroConta.text));
    Navigator.pop(context, transferencia);
  }
}
