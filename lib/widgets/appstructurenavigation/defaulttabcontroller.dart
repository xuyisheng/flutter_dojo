import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DefaultTabControllerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('DefaultTabController的基本使用'),
        Container(
          height: 300,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: const <Widget>[
                    Tab(child: Text('Tab 1')),
                    Tab(child: Text('Tab 2')),
                    Tab(child: Text('Tab 3')),
                  ],
                ),
              ),
              body: Container(
                height: 200,
                child: TabBarView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'TabView 1',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'TabView 2',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'TabView 3',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        MainTitleWidget('DefaultTabController的自定义使用'),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(2),
          ),
          child: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Material(
              borderRadius: BorderRadius.circular(2),
              type: MaterialType.button,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.red,
                    labelStyle: const TextStyle(fontSize: 16),
                    unselectedLabelStyle: const TextStyle(fontSize: 16),
                    indicatorColor: Colors.green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    indicatorPadding: const EdgeInsets.all(8),
                    indicatorWeight: 2,
                    tabs: const <Widget>[
                      Tab(child: Text('Tab 1')),
                      Tab(child: Text('Tab 2')),
                      Tab(child: Text('Tab 3')),
                    ],
                  ),
                  Container(
                    height: 200,
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'TabView 1',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'TabView 2',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'TabView 3',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
