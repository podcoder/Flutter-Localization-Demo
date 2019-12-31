import 'package:flutter/material.dart';
import 'package:flutter_localization/localization/app_localizations.dart';
import 'package:flutter_localization/router/route_constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(buildTranslate(context, 'home_page')),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(buildTranslate(context, 'note')),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              height: 50,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                Navigator.pushNamed(context, aboutRoute);
              },
              child: Text(
                buildTranslate(context, 'go_to_about'),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
