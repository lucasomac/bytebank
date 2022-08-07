import 'dart:convert';

import 'package:http/http.dart';

import '../../models/transaction.dart';
import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(apiUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic result) => Transaction.fromJson(result))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final Response response = await client.post(apiUrl,
        headers: {
          "Content-type": "application/json",
          "password": password,
        },
        body: jsonEncode(transaction.toJson()));
    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(_getMessageByCode(response.statusCode));
    }
  }

  String? _getMessageByCode(int statusCode) =>
      _statusCodeResponse.containsKey(statusCode)
          ? _statusCodeResponse[statusCode]
          : 'Unknown error';

  static final Map<int, String> _statusCodeResponse = {
    400: "There was an error submitting transaction!",
    401: "Authentication failed!",
    404: "Transaction not found!",
    408: "Request timed out!",
    409: "Transaction already exists!",
    500: "Server error!",
  };
}
