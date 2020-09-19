import 'package:Vacuate/Custom/highlightedText.dart';
import 'package:flutter/material.dart';
import 'package:Vacuate/constants.dart';
import 'package:Vacuate/Custom/page_title.dart';
import 'package:Vacuate/Widgets/BuildingsListView.dart';

import '../Custom/custom_card.dart';
import '../constants.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              PageTitle(
                title: "Vacuate",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Buildings", style: subTextStyle),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Column(
                children: [
                  BuildingsListView(numOfPeople: "20", address: "438 5th Ave, NYC", smartCameraAmount: "40",)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
