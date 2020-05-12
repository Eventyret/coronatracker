import 'package:coronavirus_tracker/app/services/api.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  EndpointsData({@required this.values});
  final Map<Endpoint, int> values;

  int get cases => values[Endpoint.cases];
  int get deaths => values[Endpoint.deaths];
  int get recovered => values[Endpoint.recovered];
  int get todayCases => values[Endpoint.todayCases];
  int get todayDeaths => values[Endpoint.todayDeaths];
  @override
  String toString() =>
      'cases: $cases, deaths: $deaths, recovered: $recovered, todayCases: $todayCases, todayDeaths: $todayDeaths';
}
