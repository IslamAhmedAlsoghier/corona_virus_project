import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../localization/set_localization.dart';
import '../pages/countries_pages.dart';

class RegionalWorldWide extends StatelessWidget {
  const RegionalWorldWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            SetLocalization.Of(context).getTranslateValues('WorldWide')!,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Countriespage()));
            },
            child: Text(
              SetLocalization.Of(context).getTranslateValues('Regional')!,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // style: ButtonStyle(
            //   backgroundColor:
            //       MaterialStatePropertyAll<Color>(Colors.blue),
            //   elevation: MaterialStatePropertyAll(2.0),
            //   shape: MaterialStatePropertyAll<OutlinedBorder>(
            //       CircleBorder(
            //           side: BorderSide.none, eccentricity: 0.8)),
            // )
          )
        ],
      ),
    );
  }
}
