import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:corona_virus_app/widgets/info_Card_Panel.dart';

class WorldWidePanel extends StatelessWidget {
  final Map? covidWorldData;
  final Map? covidCountryhistoryData;

  const WorldWidePanel({
    Key? key,
    Map? mostEffectiveCountries,
    this.covidWorldData,
    this.covidCountryhistoryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: [
          InfoCardPanel(
            iconColor: Colors.blueAccent,
            press: () {},
            title: 'CASES',
            effctdNum: covidWorldData!['cases'],
            covidCountryhistoryData: covidCountryhistoryData,
          ),
          InfoCardPanel(
            iconColor: Colors.redAccent,
            press: () {},
            title: 'DEATHS',
            effctdNum: covidWorldData!['deaths'],
            covidCountryhistoryData: covidCountryhistoryData,
          ),
          InfoCardPanel(
            iconColor: Colors.greenAccent,
            press: () {},
            title: 'RECOVERD',
            effctdNum: covidWorldData!['recovered'],
            covidCountryhistoryData: covidCountryhistoryData,
          ),
          InfoCardPanel(
            iconColor: Colors.blueGrey,
            press: () {},
            title: 'ACTIVE',
            effctdNum: covidWorldData!['active'],
            // covidCountryhistoryData: null,
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  const StatusPanel({
    Key? key,
    required this.panelColor,
    required this.textColor,
    required this.title,
    required this.count,
  }) : super(key: key);

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
          Text(
            count,
            style: GoogleFonts.lato(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
