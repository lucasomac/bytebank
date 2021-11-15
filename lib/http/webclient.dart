import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('REQUEST');
    print('URL => ${data.url}');
    print('HEADERS => ${data.headers}');
    print('DATA => ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE');
    print('CODE => ${data.statusCode}');
    print('HEADERS => ${data.headers}');
    print('DATA => ${data.body}');
    return data;
  }
}

var url = Uri(scheme: 'https://flutter-course-api.herokuapp.com/transactions');
Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

Future<List<Transaction>> findAll() async {
  final Response response =
      await client.get(url).timeout(const Duration(seconds: 15));
  final List<dynamic> decodeJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> element in decodeJson) {
    transactions.add(Transaction.fromJson(element));
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Response response = await client.post(url,
      headers: {"Content-type": "application/json", "password": "1000"},
      body: jsonEncode(transaction.toJson()));
  return Transaction.fromJson(jsonDecode(response.body));
  // return Transaction.fromJson(jsonDecode((await client.post(url,
  //         headers: {"Content-type": "application/json", "password": "1000"},
  //         body: jsonEncode(transaction.toJson())))
  //     .body));
}
