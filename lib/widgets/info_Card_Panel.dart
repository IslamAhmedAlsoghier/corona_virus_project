import 'package:corona_virus_app/localization/set_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:corona_virus_app/widgets/line_chart.dart';

class InfoCardPanel extends StatelessWidget {
  final String title;
  final int effctdNum;
  final Color? iconColor;
  final Function? press;
  final Map? covidCountryhistoryData;

  const InfoCardPanel({
    Key? key,
    required this.title,
    required this.effctdNum,
    this.iconColor,
    this.press,
    this.covidCountryhistoryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Builder) {
      return Container(
        margin: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: press!(),
          child: Container(
            width: (MediaQuery.of(context).size.width / 2) - 10,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: iconColor!.withOpacity(.12),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/running.svg',
                            height: 12,
                            width: 12,
                            // ignore: deprecated_member_use
                            color: iconColor!,
                          ),
                        ),
                        Text(
                          SetLocalization.Of(context)
                              .getTranslateValues(title)!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: iconColor!,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: iconColor!,
                                  ),
                                  children: [
                                TextSpan(
                                    text: '$effctdNum \n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: iconColor!)),
                                TextSpan(
                                    text: SetLocalization.Of(context)
                                        .getTranslateValues('people')!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 2,
                                        fontWeight: FontWeight.bold))
                              ])),
                        ),
                        Expanded(
                            child: LineChartReport(
                          iconColor: iconColor!,
                          covidCountryhistoryData: covidCountryhistoryData,
                          title: title,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
