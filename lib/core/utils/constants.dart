Map<String, String> _headers(String? token) {
  return {'Content-type': 'application/json', 'Authorization': 'bearer $token'};
}

uriConverter(String baseUrl, String url) {
  print('$baseUrl/$url');
  return Uri.https(baseUrl, url);
}

const kHeaders = _headers;
