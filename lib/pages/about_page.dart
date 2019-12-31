import 'package:flutter/material.dart';
import 'package:flutter_localization/localization/app_localizations.dart';
import 'package:flutter_localization/localization/language_constants.dart';
import 'package:flutter_localization/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  void _changeLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LAGUAGE_CODE, languageCode);
    Locale locale;
    switch (languageCode) {
      case ENGLISH:
        locale = Locale(languageCode, 'US');
        break;
      case FARSI:
        locale = Locale(languageCode, 'IR');
    }
    FlutterLocalization.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(buildTranslate(context, 'about_page')),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(buildTranslate(context, 'about_app')),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  _changeLanguage(ENGLISH);
                },
                child: Text(
                  buildTranslate(context, 'english'),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  _changeLanguage(FARSI);
                },
                child: Text(
                  buildTranslate(context, 'farsi'),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
