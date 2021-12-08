import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: new EdgeInsets.only(top: 15.0),
        child: SizedBox(
          height: 10.0,
          width: 65,
          child: new Center(
            child: new Container(
              height: 5.0,
              width: 75,
              color: Colors.red,
            ),
          ),
        ));
  }
}
