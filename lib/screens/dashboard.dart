import 'package:flutter/material.dart';

import '../components/feature_item.dart';
import 'contacts_list.dart';
import 'transactions_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/bytebank_logo.png'),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    FeatureItem(
                      "Transfer",
                      Icons.monetization_on,
                      onClick: () {
                        _showContactsList(context);
                      },
                    ),
                    FeatureItem(
                      "Transaction feed",
                      Icons.description,
                      onClick: () => _showTransactionsList(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showTransactionsList(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => TransactionsList(),
  ));
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ContactsList(),
  ));
}
