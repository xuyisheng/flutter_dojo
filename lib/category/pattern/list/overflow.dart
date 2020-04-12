import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class OverflowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SubtitleWidget(
            '通过SingleChildScrollView或者在Scaffold中设置resizeToAvoidBottomInset\\resizeToAvoidBottomPadding为false来解决布局Overflow的问题'),
        Text(
          'Login',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              prefixIcon: Icon(Icons.verified_user),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              prefixIcon: Icon(Icons.verified_user),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              prefixIcon: Icon(Icons.verified_user),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              prefixIcon: Icon(Icons.verified_user),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
