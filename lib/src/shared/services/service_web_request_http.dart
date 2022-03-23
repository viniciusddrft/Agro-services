import 'interfaces/service_web_request_interface.dart';

import 'package:http/http.dart' as http;

class ServiceWebHttp implements ServiceWebRequestInterface {
  @override
  Future get(String url, {Map<String, String>? headers}) =>
      http.get(Uri.parse(url), headers: headers);

  @override
  Future post(String url, {Map<String, String>? headers}) =>
      http.post(Uri.parse(url), headers: headers);

  @override
  Future delete(String url, {Map<String, String>? headers}) =>
      http.delete(Uri.parse(url), headers: headers);
}
