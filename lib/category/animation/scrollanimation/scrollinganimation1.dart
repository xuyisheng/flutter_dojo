import 'package:flutter/material.dart';

class ScrollingAnimation1Widget extends StatefulWidget {
  @override
  _ScrollingAnimation1WidgetState createState() => _ScrollingAnimation1WidgetState();
}

class _ScrollingAnimation1WidgetState extends State<ScrollingAnimation1Widget> {
  double cWidth = 0.0;
  double screenWidth;

  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width - 40;

    return NotificationListener(
      onNotification: (ScrollNotification scrollNotification) {
        double progress = scrollNotification.metrics.pixels / scrollNotification.metrics.maxScrollExtent;
        cWidth = screenWidth * progress;
        setState(() {});
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 30,
            width: cWidth,
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: Text('${(cWidth / screenWidth * 100).toStringAsFixed(2)}%'),
          ),
          Flexible(
            child: ListView(
              children: List.generate(
                20,
                (index) => ListTile(
                  title: Text(index.toString()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
