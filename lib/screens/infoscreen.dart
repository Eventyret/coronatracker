import 'package:coronavirus_tracker/constant.dart';
import 'package:coronavirus_tracker/widgets/header.dart';
import 'package:coronavirus_tracker/widgets/symptom_card.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyHeader(
            image: "assets/icons/coronadr.svg",
            textTop: "Get to know",
            textBottom: "About Covid-19",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomsCard(
                      image: "assets/images/headache.png",
                      title: "Headache",
                      isActive: true,
                    ),
                    SymptomsCard(
                      image: "assets/images/caugh.png",
                      title: "Caugh",
                      isActive: false,
                    ),
                    SymptomsCard(
                      image: "assets/images/fever.png",
                      title: "Fever",
                      isActive: false,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
