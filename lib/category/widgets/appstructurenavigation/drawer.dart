import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.all(16),
              child: Text(
                'Android群英传',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage('images/book.jpg'),
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            UserAccountsDrawerHeader(
              accountName: Text('XuYisheng'),
              accountEmail: Text('XuYisheng89@163.com'),
            ),
            ListTile(
              title: Text('Title1'),
            ),
            ListTile(
              title: Text('Title1'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Dismiss'),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
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
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Dismiss'),
            )
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          MainTitleWidget('Drawer基本使用'),
          RaisedButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            child: Text('Open Drawer'),
          ),
          RaisedButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            child: Text('Open EndDrawer'),
          ),
        ],
      ),
    );
  }
}
