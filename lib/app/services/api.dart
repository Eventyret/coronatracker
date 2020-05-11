import 'package:coronavirus_tracker/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint {
  cases,
  totalTests,
  deaths,
  recovered,
  todayCases,
  todayDeaths,
  critical
}

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'apigw.nubentos.com';
  static final int port = 443;
  static final String basePath = 't/nubentos.com/ncovapi/2.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
      scheme: 'https',
      host: host,
      port: port,
      path: '$basePath/${_paths[endpoint]}');

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.totalTests: 'totalTests',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
    Endpoint.todayCases: 'todayCases',
    Endpoint.todayDeaths: 'todayDeaths',
    Endpoint.critical: 'critical',
  };
}
