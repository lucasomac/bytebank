import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTranferencia extends StatelessWidget {
  final Transfer _tranferencia;

  const ItemTranferencia(this._tranferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_tranferencia.value.toString()),
        subtitle: Text(_tranferencia.accountNumber.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
