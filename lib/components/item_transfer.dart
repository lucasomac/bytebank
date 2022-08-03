import 'package:flutter/material.dart';

import '../models/transfer.dart';

class ItemTransfer extends StatelessWidget {
  final Transfer _transfer;

  const ItemTransfer(this._transfer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
