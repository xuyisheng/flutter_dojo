import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return await Future.delayed(Duration(seconds: 3));
      },
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          MainTitleWidget('RefreshIndicator基本使用'),
          Container(
            height: 50,
            color: Colors.red,
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.yellow,
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
