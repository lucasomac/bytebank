import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(apiUrl).timeout(const Duration(seconds: 15));
    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic result) => Transaction.fromJson(result))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    return Transaction.fromJson(jsonDecode((await client.post(apiUrl,
            headers: {"Content-type": "application/json", "password": "1000"},
            body: jsonEncode(transaction.toJson())))
        .body));
  }
}
