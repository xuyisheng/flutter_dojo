import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListAlphaAppBarWidget extends StatefulWidget {
  @override
  _ListAlphaAppBarWidgetState createState() => _ListAlphaAppBarWidgetState();
}

class _ListAlphaAppBarWidgetState extends State<ListAlphaAppBarWidget> {
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                double alpha = scrollNotification.metrics.pixels / 100;
                if (alpha < 0) {
                  alpha = 0;
                } else if (alpha > 1) {
                  alpha = 1;
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
                }
                setState(() => appBarAlpha = alpha);
              }
              return true;
            },
            child: ListView.builder(
              padding: EdgeInsets.only(top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24),
              itemCount: 9,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80,
                  margin: EdgeInsets.all(16),
                  color: Colors.blueAccent,
                );
              },
            ),
          ),
        ),
        Container(
          height: 86.0,
          decoration: BoxDecoration(
            color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: appBarAlpha == 1.0 ? Colors.black12 : Colors.transparent,
                offset: Offset(2, 3),
                blurRadius: 6,
                spreadRadius: 0.6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
