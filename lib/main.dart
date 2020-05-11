import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/repositories/data_repository.dart';
import 'app/services/api.dart';
import 'app/services/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(
          API.sandbox(),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0XFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accessToken = '';
  int _cases;
  int _deaths;

  void _updateAccessToken() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.cases,
    );
    final deaths = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.deaths,
    );
    setState(() {
      _accessToken = accessToken;
      _deaths = deaths;
      _cases = cases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_accessToken',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (_cases != null)
              Text(
                'Cases: $_cases',
                style: Theme.of(context).textTheme.headline4,
              ),
            if (_cases != null)
              Text(
                'Deaths: $_deaths',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateAccessToken,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
