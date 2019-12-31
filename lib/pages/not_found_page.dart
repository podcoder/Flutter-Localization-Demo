import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              ' 🧐 Page Not Found',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
