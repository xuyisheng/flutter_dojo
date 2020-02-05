import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('自定义AppBar'),
        Container(
          height: 70,
          child: Center(
            child: Text(
              'Title',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikMonoOne',
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
            ),
          ),
        ),
        MainTitleWidget('PreferdSize'),
        Container(
          height: 200,
          child: Scaffold(
            appBar: PreferredSize(
              child: AppBar(
                title: Row(
                  children: <Widget>[
                    Text(
                      'PreferdSize修改APPBar默认高度',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(100),
            ),
            body: Container(),
          ),
        ),
      ],
    );
  }
}
