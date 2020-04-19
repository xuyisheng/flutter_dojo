import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CircleAvatar基本使用'),
        Container(
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50,
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50,
            backgroundImage: AssetImage('images/book.jpg'),
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/book.jpg'),
            child: Icon(
              Icons.star,
              color: Colors.blueAccent,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
