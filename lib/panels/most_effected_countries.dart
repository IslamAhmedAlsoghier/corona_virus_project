import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MostEffectedCountries extends StatelessWidget {
  final List? mostEffectedCountries;
  const MostEffectedCountries({
    Key? key,
    required this.mostEffectedCountries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: Color.fromARGB(255, 240, 105, 134),
              //padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    mostEffectedCountries![index]['countryInfo']['flag'],
                    height: 20,
                  ),
                  Text(
                    mostEffectedCountries![index]['country'],
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mostEffectedCountries![index]['deaths'].toString(),
                    style: GoogleFonts.lato(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
