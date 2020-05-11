import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final response = await http.post(
      api.tokenUri().toString(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != 200) {
        return accessToken;
      }
    }
    print('Request ${api.tokenUri()} failed\nResposne: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
