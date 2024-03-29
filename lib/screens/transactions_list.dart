import 'package:flutter/material.dart';

import '../components/centered_message.dart';
import '../components/progress.dart';
import '../http/webclients/transaction_web_client.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _transactionWebClient = TransactionWebClient();

  TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _transactionWebClient.findAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                  child: Text('System temporarily unavailable.'));
            case ConnectionState.waiting:
              return const Progress('Loading');
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<Transaction> data = snapshot.data!;
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
              }
              return const CenteredMessage(
                "No transactions found!",
                icon: Icons.warning,
              );
          }
          return const Center(child: Text('System temporarily unavailable.'));
        },
      ),
    );
  }
}
