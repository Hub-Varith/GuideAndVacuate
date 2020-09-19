import 'package:flutter/material.dart';
import 'package:Vacuate/Custom/highlightedText.dart';
import 'package:Vacuate/Custom/custom_card.dart';
import 'package:Vacuate/constants.dart';

class BuildingsListView extends StatefulWidget {
  final String smartCameraAmount;
  final String address;
  final String numOfPeople;

  BuildingsListView(
      {Key key, this.smartCameraAmount, this.address, this.numOfPeople})
      : super(key: key);

  @override
  _BuildingsListViewState createState() => _BuildingsListViewState();
}

class _BuildingsListViewState extends State<BuildingsListView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/office_info"),
      child: CustomCard(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      alignment: Alignment.center,
                      child: Text(
                        "Office",
                        style: cardTextStyle,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "Smart Cameras:     ",
                            style: normalTextStyle,
                            textAlign: TextAlign.start,
                          ),
                          HighlightedText(text: widget.smartCameraAmount),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "Number of People: ",
                            style: normalTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 6),
                          HighlightedText(text: widget.numOfPeople),
                        ],
                      ),
                    ),
                    SizedBox(height: 14),
                    HighlightedText(text: widget.address)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: VerticalDivider(
                    color: Colors.black,
                    // height: ,
                    // thickness: 0.1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/map.png",
                    scale: 3.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
