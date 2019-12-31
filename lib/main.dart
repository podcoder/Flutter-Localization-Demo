import 'package:flutter/material.dart';
import 'package:flutter_localization/localization/app_localizations.dart';
import 'package:flutter_localization/router/route_constants.dart';
import 'package:flutter_localization/router/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/language_constants.dart';

void main() => runApp(FlutterLocalization());

class FlutterLocalization extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) async {
    _FlutterLocalizationState state =
        context.findAncestorStateOfType<_FlutterLocalizationState>();
    state.setLocale(newLocale);
  }

  @override
  _FlutterLocalizationState createState() => _FlutterLocalizationState();
}

class _FlutterLocalizationState extends State<FlutterLocalization> {
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Localization',
        theme: ThemeData(primaryColor: Colors.blue[800]),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('fa', 'IR'),
        ],
        locale: _locale,
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: homeRoute,
        onGenerateRoute: Router.generatedRoute,
      );
    }
  }

  _fetchLocale() async {
    Locale tempLocale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = (prefs.getString(LAGUAGE_CODE) ?? 'en');

    switch (languageCode) {
      case ENGLISH:
        tempLocale = Locale(ENGLISH, 'US');
        break;
      case FARSI:
        tempLocale = Locale(FARSI, 'IR');
        break;
      default:
        tempLocale = Locale(ENGLISH, 'US');
    }
    return tempLocale;
  }
}
