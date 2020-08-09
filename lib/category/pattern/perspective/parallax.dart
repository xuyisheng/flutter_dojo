import 'package:flutter/material.dart';

class ParallaxWidget extends StatefulWidget {
  @override
  _ParallaxWidgetState createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {
  double rateOne = 0;
  double rateTwo = 0;

  String asset;
  double top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              rateTwo -= v.scrollDelta / 2.5;
              rateOne -= v.scrollDelta / 4.5;
            });
          }
          return true;
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: rateOne,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/book.jpg'),
            ),
            Positioned(
              top: rateTwo,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/book_logo.jpg'),
            ),
            ListView(
              children: <Widget>[
                Container(
                  height: 600,
                  color: Colors.transparent,
                ),
                Container(
                  color: Colors.blueAccent,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Parallax',
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1.8,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'XuYisheng',
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1.8,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
