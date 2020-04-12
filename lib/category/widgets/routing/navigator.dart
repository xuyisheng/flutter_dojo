import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class NavigatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过Navigator创建子路由'),
        Expanded(
          child: MyData(
            data: 'share data',
            child: Navigator(
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case 'page1':
                    return MaterialPageRoute(builder: (context) => PageOne());
                  case 'page2':
                    return MaterialPageRoute(builder: (context) => PageTwo());
                  default:
                    return MaterialPageRoute(builder: (context) => PageThree());
                }
              },
              initialRoute: 'page1',
            ),
          ),
        ),
      ],
    );
  }
}

class MyData extends InheritedWidget {
  MyData({Key key, this.child, this.data}) : super(key: key, child: child);

  final Widget child;
  final String data;

  static MyData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyData>();
  }

  @override
  bool updateShouldNotify(MyData oldWidget) {
    return true;
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto page 2, data=${MyData.of(context).data}"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PageTwo()));
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto page 3, data= ${MyData.of(context).data}"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PageThree()));
          },
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto page 4, data=${MyData.of(context).data}"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
