import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/components/formulario.dart';
import 'package:flutter/material.dart';

import '../components/item_transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> entries = [];

  ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
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
            return ItemTranferencia(widget.entries[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute<Transferencia>(
              builder: (context) {
                return const FormularioTransferencia();
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
