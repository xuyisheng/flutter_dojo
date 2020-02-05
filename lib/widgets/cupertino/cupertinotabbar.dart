import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabBarWidget extends StatefulWidget {
  @override
  _CupertinoTabBarWidgetState createState() => _CupertinoTabBarWidgetState();
}

class _CupertinoTabBarWidgetState extends State<CupertinoTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        iconSize: 40.0,
        backgroundColor: Colors.grey,
        activeColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text('mine')),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('tab $index'),
              ),
              child: Center(
                  child: Text(
                'TabView $index',
              )),
            );
          },
        );
      },
    );
  }
}
