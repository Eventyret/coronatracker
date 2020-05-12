import 'package:coronavirus_tracker/app/services/data_cache_Service.dart';
import 'package:coronavirus_tracker/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/repositories/data_repository.dart';
import 'app/services/api.dart';
import 'app/services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        title: 'Covid 19',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(
                left: 40,
                top: 75,
                right: 20,
              ),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/virus.png"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/icons/menu.svg")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
