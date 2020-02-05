import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('TabBar基本使用'),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('TabBar'),
              leading: Icon(Icons.home),
              backgroundColor: Colors.amber[1000],
              bottom: TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: <Widget>[
                  Tab(text: "Tabs 1"),
                  Tab(text: "Tabs 2"),
                  Tab(text: "Tabs 3"),
                  Tab(text: "Tabs 4"),
                  Tab(text: "Tabs 5"),
                  Tab(text: "Tabs 6"),
                ],
              ),
            ),
            body: TabBarView(controller: _tabController, children: <Widget>[
              Text('TabsView 1'),
              Text('TabsView 2'),
              Text('TabsView 3'),
              Text('TabsView 4'),
              Text('TabsView 5'),
              Text('TabsView 6'),
            ]),
          ),
        ),
      ],
    );
  }
}
