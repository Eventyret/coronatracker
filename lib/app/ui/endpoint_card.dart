import 'package:coronavirus_tracker/app/services/api.dart';
import 'package:flutter/material.dart';

class EndPointCardData {
  EndPointCardData(this.title, this.assetName, this.color);
  final String title;
  final String assetName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndPointCardData> _cardsData = {
    Endpoint.cases:
        EndPointCardData('Cases', 'assets/count.png', Color(0xFFFFF492)),
    Endpoint.deaths:
        EndPointCardData('Deaths', 'assets/death.png', Color(0xFFEEDA28)),
    Endpoint.recovered:
        EndPointCardData('Recovered', 'assets/patient.png', Color(0xFFE99600)),
    Endpoint.todayCases: EndPointCardData(
        'Cases Today', 'assets/suspect.png', Color(0xFFE40000)),
    Endpoint.todayDeaths:
        EndPointCardData('Deaths Today', 'assets/death.png', Color(0xFF70A901)),
  };

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cardData.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(cardData.assetName),
                    Text(
                      value != null ? value.toString() : '',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
