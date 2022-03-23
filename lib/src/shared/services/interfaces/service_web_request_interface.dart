abstract class ServiceWebRequestInterface {
  Future get(String url, {Map<String, String>? headers});

  Future post(String url, {Map<String, String>? headers});

  Future delete(String url, {Map<String, String>? headers});
}
