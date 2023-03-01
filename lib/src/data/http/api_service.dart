import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

var client = http.Client();

class ApiService {
  String baseUrl = "https://api.github.com/users";

  Future get({required String endpoint}) async {
    try {
      return await client.get(Uri.https('$baseUrl/$endpoint'));
    } catch (e) {
      rethrow;
    }
  }

  checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
      case 403:
        throw const HttpException("Bad Request");

      case 404:
        throw const HttpException("Not found!");

      default:
        throw Exception("We are unable to do that!");
    }
  }
}
