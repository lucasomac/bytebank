import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: findAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
          List<Transaction> data = [];
          if (snapshot.hasData) {
            data = snapshot.data!;
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                  child: Text('Sistema Temporariamente Indisponível'));
            case ConnectionState.waiting:
              return const Progress('Loading');
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              if (data.isNotEmpty) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Transaction transaction = data[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return CenteredMessage(
                "No transactions found!",
                icon: Icons.warning,
              );
              break;
          }
          return const Center(
              child: Text('Sistema Temporariamente Indisponível'));
        },
      ),
    );
  }
}
