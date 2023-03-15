import 'dart:convert';

import 'package:corona_virus_app/localization/localization_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../localization/set_localization.dart';
import '../panels/datasourse.dart';

class FAQSpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SetLocalization.Of(context).getTranslateValues('FAQS')!),
      ),
      body: ListView.builder(
        itemCount: DataSourse.questions_And_Answres.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(SetLocalization.Of(context).getCurrentCode() == ENGLISH
                ? DataSourse.questions_And_Answres[index]['question']
                : DataSourse.questions_And_Answres_In_Ar[index]['question']),
            children: [
              Text(SetLocalization.Of(context).getCurrentCode() == ENGLISH
                  ? DataSourse.questions_And_Answres[index]['answer']
                  : DataSourse.questions_And_Answres_In_Ar[index]['answer']),
            ],
          );
        },
      ),
    );
  }
}
