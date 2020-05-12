import 'package:coronavirus_tracker/app/services/api.dart';
import 'package:coronavirus_tracker/app/services/endpoint_data.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  EndpointsData({@required this.values});
  final Map<Endpoint, EndpointData> values;

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];
  EndpointData get todayCases => values[Endpoint.todayCases];
  EndpointData get todayDeaths => values[Endpoint.todayDeaths];
  @override
  String toString() =>
      'cases: $cases, deaths: $deaths, recovered: $recovered, todayCases: $todayCases, todayDeaths: $todayDeaths';
}
