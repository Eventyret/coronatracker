import 'package:coronavirus_tracker/app/services/api.dart';
import 'package:coronavirus_tracker/app/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({@required this.apiService});
  final APIService apiService;
  String _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await apiService.getEndpointData(
          accessToken: _accessToken, endpoint: endpoint);
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData(
            accessToken: _accessToken, endpoint: endpoint);
      }
      rethrow;
    }
  }

  Future<void> _getAllEndpointsData() async {
    await Future.wait([
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.cases),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.totalTests),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.deaths),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.recovered),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.todayCases),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.todayDeaths),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.critical),
    ]);
  }
}
