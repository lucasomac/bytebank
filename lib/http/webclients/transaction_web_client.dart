import 'dart:convert';

import 'package:http/http.dart';

import '../../models/transaction.dart';
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

  Future<Transaction> save(Transaction transaction, String password) async {
    final Response response = await client.post(apiUrl,
        headers: {"Content-type": "application/json", "password": password},
        body: jsonEncode(transaction.toJson()));
    switch (response.statusCode) {
      case 200:
        return Transaction.fromJson(jsonDecode(response.body));
      case 400:
        throw Exception("There was an error submitting transaction!");
      case 401:
        throw Exception("Authentication failed!");
    }
    return Transaction.fromJson(jsonDecode(response.body));
  }
}
