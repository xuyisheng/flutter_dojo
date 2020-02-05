import 'package:flutter/material.dart';

class MainPagePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 64,
            ),
            SizedBox(width: 16),
            Text(
              'Flutter Dojo',
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
