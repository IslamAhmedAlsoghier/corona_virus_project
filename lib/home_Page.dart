import 'dart:convert';

import 'package:corona_virus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:corona_virus_app/pages/FAQS.dart';
import 'package:corona_virus_app/panels/info_panel.dart';
import 'package:corona_virus_app/panels/most_effected_countries.dart';
import 'package:corona_virus_app/panels/regional_World.dart';
import 'package:corona_virus_app/panels/wild_World_panel.dart';

import 'localization/localization_methods.dart';
import 'localization/models.dart';
import 'localization/set_localization.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? covidWorldData;
// Get Covid19 Info from internet
  Future<void> getCovidWorldData() async {
    var url = Uri.parse('https://disease.sh/v3/covid-19/all');
    http.Response response = await http.get(url);

    setState(() {
      covidWorldData = json.decode(response.body)!;
    });
  }

  List? mostEffectedCountries;
// Get Most Effected Countries  Info from internet
  Future<void> getmostEffectiveCountries() async {
    var url = Uri.parse('https://disease.sh/v3/covid-19/countries');
    http.Response response = await http.get(url);

    setState(() {
      mostEffectedCountries = json.decode(response.body)!;
    });
  }

  Map? covidCountryhistoryData;
// Get Covid19  historical  data country Info from internet
  Future<void> getcovidCountryhistoryData() async {
    var url = Uri.parse('https://disease.sh/v3/covid-19/historical/all');
    http.Response response = await http.get(url);

    setState(() {
      covidCountryhistoryData = json.decode(response.body)!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCovidWorldData();
    getmostEffectiveCountries();
    getcovidCountryhistoryData();
  }

  @override
  Widget build(BuildContext context) {
    String qoute =
        'All you need to know to protect yourself and your children, Help us!';
    var mostEffectedCountries2 = mostEffectedCountries;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 66, 65),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(43, 15, 70, 0.996),
          title: Text(
            SetLocalization.Of(context).getTranslateValues('Covid 19')!,
            style: GoogleFonts.lato(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          // centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(8),
              child: DropdownButton(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                items: Language.languageList()
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.flags,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(e.name)
                          ],
                        )))
                    .toList(),
                onChanged: (Language? language) {
                  _changeLanguage(language!);
                },
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              color: Color.fromARGB(97, 99, 156, 76),
              padding: EdgeInsets.all(10),
              child: Text(
                SetLocalization.Of(context).getTranslateValues(qoute)!,
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            RegionalWorldWide(),
            // Most Covid  World Data panel
            covidWorldData == null
                ? const CircularProgressIndicator()
                : WorldWidePanel(
                    covidWorldData: covidWorldData,
                    covidCountryhistoryData: covidCountryhistoryData,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                SetLocalization.Of(context)
                    .getTranslateValues('Most Affected Countries')!,
                style: GoogleFonts.lato(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Most Effected Countries  panel
            mostEffectedCountries == null
                ? Container()
                : MostEffectedCountries(
                    mostEffectedCountries: mostEffectedCountries,
                  ),
            SizedBox(
              height: 15,
            ),
            InfoPanel(),
            SizedBox(
              height: 5,
            ),
            Text(
              SetLocalization.Of(context)
                  .getTranslateValues('One World One health !')!,
              style: GoogleFonts.lato(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temp);
  }
}
