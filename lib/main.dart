import 'package:corona_virus_app/localization/localization_methods.dart';
import 'package:corona_virus_app/localization/set_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:corona_virus_app/home_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((value) => {
          setState(() {
            _locale = value;
          })
        });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MaterialApp(
        locale: _locale,
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        home: Home(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          SetLocalization.localizationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (deviceLocal, supportedLocal) {
          for (var local in supportedLocal) {
            if (local.languageCode == deviceLocal?.languageCode &&
                local.countryCode == deviceLocal?.countryCode) {
              return deviceLocal;
            }
          }
          return supportedLocal.first;
        },
      );
    }
  }
}
