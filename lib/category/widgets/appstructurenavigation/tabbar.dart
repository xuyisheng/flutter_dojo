import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  var tabs = ['1', '2', '3', '4', '5', '6'];

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('TabBar基本使用-结合Scaffold'),
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
        SubtitleWidget('自定义TabBar位置'),
        Expanded(
          child: Scaffold(
            appBar: PreferredSize(
              child: Container(
                color: Colors.grey.shade200,
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 10),
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle: TextStyle(fontSize: 10),
                  controller: _tabController,
                  tabs: tabs.map((v) => Tab(text: v)).toList(),
                ),
              ),
              preferredSize: Size.fromHeight(50),
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
