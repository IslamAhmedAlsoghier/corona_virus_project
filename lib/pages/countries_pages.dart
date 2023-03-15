import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../localization/set_localization.dart';

class Countriespage extends StatefulWidget {
  Countriespage({Key? key}) : super(key: key);

  @override
  State<Countriespage> createState() => _CountriespageState();
}

class _CountriespageState extends State<Countriespage> {
  List? dataCountries;
// Get data of the  Countries  Info from internet
  Future<void> getdataCountries() async {
    var url = Uri.parse('https://disease.sh/v3/covid-19/countries');
    http.Response response = await http.get(url);

    setState(() {
      dataCountries = json.decode(response.body)!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdataCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SetLocalization.Of(context)
            .getTranslateValues('Countries Status')!),
      ),
      body: dataCountries == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataCountries == null ? 0 : dataCountries!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 130,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(174, 153, 151, 151),
                      offset: Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ]),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dataCountries![index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              dataCountries![index]['countryInfo']['flag'],
                              height: 40,
                              width: 50,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'cases:' +
                                  dataCountries![index]['cases'].toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              'deaths:' +
                                  dataCountries![index]['deaths'].toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                            Text(
                              'recovered:' +
                                  dataCountries![index]['recovered'].toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            ),
                            Text(
                              'active:' +
                                  dataCountries![index]['active'].toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              },
            ),
    );
  }
}
