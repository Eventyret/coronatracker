import 'package:coronavirus_tracker/app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);
  final Endpoint endpoint;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Text(
            'Cases',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            value != null ? value.toString() : '',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
