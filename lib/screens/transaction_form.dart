import 'package:bytebank/components/progress.dart';
import 'package:bytebank/utils/functions.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../components/response_dialog.dart';
import '../components/transaction_auth_dialog.dart';
import '../http/webclients/transaction_web_client.dart';
import '../models/contact.dart';
import '../models/transaction.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  const TransactionForm(this.contact, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _transactionWebClient = TransactionWebClient();
  final transactionId = const Uuid().v4();
  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                visible: _sending,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Progress('Efetivando transação, aguarde...'),
                ),
              ),
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Value'),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt-BR',
                      decimalDigits: 2,
                      symbol: 'R\$ ',
                    )
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transfer'),
                    onPressed: () {
                      final double? value = double.tryParse(
                          Functions.unMask(_valueController.text));
                      final transactionCreated =
                          Transaction(transactionId, value, widget.contact);
                      showDialog(
                          context: context,
                          builder: (contextDialog) {
                            return TransactionAuthDialog(
                              onCancel: () {},
                              onConfirm: (String password) {
                                _save(transactionCreated, password, context);
                              },
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save(Transaction transactionCreated, String password,
      BuildContext context) async {
    setState(() {
      _sending = true;
    });
    await _transactionWebClient.save(transactionCreated, password).catchError(
        (error) {
      FirebaseCrashlytics.instance.recordError(error, null);
      FirebaseCrashlytics.instance.setCustomKey("exception", error.toString());
      FirebaseCrashlytics.instance.setCustomKey("http_code", error.code);
      FirebaseCrashlytics.instance
          .setCustomKey("htt_body", transactionCreated.toString());
      showDialog(
          context: context,
          builder: (contextDialog) {
            return FailureDialog(error.message);
          });
    }, test: (e) => e is Exception).whenComplete(() {
      setState(() {
        _sending = false;
      });
    });
    setState(() {
      _sending = false;
    });
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return const SuccessDialog('Successful transaction!');
        });
    Navigator.pop(context);
  }
}
