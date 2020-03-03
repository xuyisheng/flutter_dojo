import 'package:flutter/material.dart';
import 'package:flutter_dojo/pages/main/aboutme.dart';

class MainPagePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: kToolbarHeight,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16),
                child: FlutterLogo(),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeWidget()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kToolbarHeight / 2),
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
