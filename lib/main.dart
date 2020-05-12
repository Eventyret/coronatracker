import 'package:coronavirus_tracker/app/services/data_cache_Service.dart';
import 'package:coronavirus_tracker/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/repositories/data_repository.dart';
import 'app/services/api.dart';
import 'app/services/api_service.dart';

void main() async {
  Intl.defaultLocale = 'en_GB';
  final sharedPrefences = await SharedPreferences.getInstance();
  await initializeDateFormatting();
  runApp(MyApp(
    sharedPrefences: sharedPrefences,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.sharedPrefences}) : super(key: key);
  final SharedPreferences sharedPrefences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
        dataCacheService: DataCacheService(sharedPreferences: sharedPrefences),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0XFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: Dashboard(),
      ),
    );
  }
}
