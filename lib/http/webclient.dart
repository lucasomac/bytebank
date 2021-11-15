import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'interceptors/logging_interceptor.dart';

var apiUrl = Uri.https('flutter-course-api.herokuapp.com', '/transactions');
Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);
