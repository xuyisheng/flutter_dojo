import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/backend/providerstate1widget.dart';
import 'package:flutter_dojo/category/backend/providerstate2widget.dart';
import 'package:flutter_dojo/category/backend/providerstate3widget.dart';
import 'package:flutter_dojo/category/backend/providerstate4widget.dart';
import 'package:flutter_dojo/category/backend/providerstate5widget.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ProviderStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTitleWidget('Provider基本使用'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(child: ProviderState1Widget()),
                ),
              ),
            );
          },
          child: Text('Provider.of获取数据'),
        ),
        MainTitleWidget('Provider Consumer'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(child: ProviderState2Widget()),
                ),
              ),
            );
          },
          child: Text('通过Consumer获取数据'),
        ),
        MainTitleWidget('Provider Selector'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(child: ProviderState3Widget()),
                ),
              ),
            );
          },
          child: Text('通过Selector获取数据'),
        ),
        MainTitleWidget('Provider'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(child: ProviderState4Widget()),
                ),
              ),
            );
          },
          child: Text('综合示例'),
        ),
        MainTitleWidget('Provider不在App顶层共享跨页面数据'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(child: ProviderState5Widget()),
                ),
              ),
            );
          },
          child: Text('子路由'),
        ),
      ],
    );
  }
}
