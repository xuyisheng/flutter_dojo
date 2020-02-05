import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Banner基本使用'),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.yellow,
          height: 100,
          child: ClipRect(
            child: Banner(
              message: "hello",
              location: BannerLocation.topEnd,
              color: Colors.red,
              child: Container(
                color: Colors.yellow,
                height: 100,
                child: Center(
                  child: Text("Banner in corner"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
