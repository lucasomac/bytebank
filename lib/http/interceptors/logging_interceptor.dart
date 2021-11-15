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
