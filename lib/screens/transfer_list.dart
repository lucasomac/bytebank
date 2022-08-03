import 'package:bytebank/components/form.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

import '../components/item_transfer.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> entries = [];

  TransferList({Key? key}) : super(key: key);

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: widget.entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemTransfer(widget.entries[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push(
            context,
            MaterialPageRoute<Transfer>(
              builder: (context) {
                return const TransferForm();
              },
            ),
          );
          future.then((transferenciaRecebida) {
            debugPrint(transferenciaRecebida.toString());
            setState(() {
              if (transferenciaRecebida != null) {
                widget.entries.add(transferenciaRecebida);
              }
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
