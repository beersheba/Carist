import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient(this.url);

  final String url;

  Future getData() async {
    var response = await getString();
    return jsonDecode(response);
  }

  Future getString() async {
    var response = await http.get(url);
    print(response.request);
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          'Failed to get data, status code = ${response.statusCode}');
    }
  }
}
