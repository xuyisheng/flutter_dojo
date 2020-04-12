import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Scaffold基本使用'),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Scaffold'),
            ),
            body: Center(
              child: Text('Scaffold'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            backgroundColor: Colors.orange,
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('XuYisheng'),
                    accountEmail: Text('XuYisheng89@163.com'),
                  ),
                  ListTile(
                    title: Text('Title1'),
                  ),
                  ListTile(
                    title: Text('Title1'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
