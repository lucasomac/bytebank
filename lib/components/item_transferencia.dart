import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTranferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  const ItemTranferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
