import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TabPageSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List tabs = ['Tab1', 'Tab2', 'Tab3', 'Tab4'];

    return Column(
      children: <Widget>[
        MainTitleWidget('TabPageSelector基本使用'),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('TabPageSelectorWidget'),
            ),
            body: DefaultTabController(
              length: tabs.length,
              child: Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    TabPageSelector(),
                    Expanded(
                      child: TabBarView(
                          children: tabs.map((value) {
                        return Text(value);
                      }).toList()),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
