import 'dart:convert';

abstract class ServiceWebRequestInterface {
  Future get(String url, {Map<String, String>? headers});

  Future post(String url,
      {Object? body, Map<String, String>? headers, Encoding? encoding});

  Future delete(String url,
      {Object? body, Map<String, String>? headers, Encoding? encoding});
}
