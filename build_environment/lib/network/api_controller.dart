import 'dart:convert';
import 'dart:io';

import '../configs/flavor_config.dart';
import 'package:http/http.dart' as http;

enum HttpMethod{
  get,
  post
}

class ApiController{
  static const int TIMEOUT_SECONDS = 5;
  final String _baseUrl = FlavorConfig.instance.apiBaseUrl;

  Future<dynamic> request(String url,HttpMethod httpMethod) async {
    final response = await ((httpMethod == HttpMethod.get) ? http.get(_baseUrl + url) : http.post(_baseUrl + url)).timeout(Duration(seconds: TIMEOUT_SECONDS),onTimeout: _onTimeout);
    if (response.statusCode != 200){
      throw Exception('Error when fetch data. Plesae check Internet connection!');
    }
    print('URL: ${_baseUrl + url}');
    final responseJson = json.decode(response.body);
    print('Response: ${response.body}');
    return responseJson;
  }

  Future<http.Response> _onTimeout() {
    throw new SocketException("Timeout during request");
  }
}