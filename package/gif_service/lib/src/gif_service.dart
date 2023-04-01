import 'dart:convert';

import 'package:http/http.dart' as http;

class GifService {
  /// {@macro gif_service}
  GifService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String baseUrl = 'api.giphy.com';
  final String endPoint = '/v1/gifs/trending';

  final String apiKey = 'qZ3UhAAx3DhZRkEfr1ZFjfvDHv82gpFE';
  Future<List<String>> fetchGifs() async {
    final uri = Uri.https(baseUrl, endPoint, {'api_key': apiKey});

    http.Response response;
    List body;
    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw Exception();
    }

    if (response.statusCode != 200) {
      throw HttpRequestException();
    }

    // Porbar este tray catch distinto
    // try {} on Exception {
    //   throw Exception();
    // }
    try {
      body = jsonDecode(response.body)['data'] as List;
    } on Exception {
      throw JsonDecodeException();
    }

    return body
        .map((url) => url['images']['original']['url'].toString())
        .toList();
  }
}

class HttpRequestException implements Exception {}

class JsonDecodeException implements Exception {}
