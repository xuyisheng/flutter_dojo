import 'package:flutter/material.dart';

class PageStorageKeyWidget extends StatefulWidget {
  @override
  _PageStorageKeyWidgetState createState() => _PageStorageKeyWidgetState();
}

class _PageStorageKeyWidgetState extends State<PageStorageKeyWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "Tabs 1"),
            Tab(text: "Tabs 2"),
            Tab(text: "Tabs 3"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabPageTestController(title: 'title1'),
          TabPageTestController(title: 'title2'),
          TabPageTestController(title: 'title3'),
        ],
      ),
    );
  }
}

class TabPageTestController extends StatefulWidget {
  final String title;

  TabPageTestController({Key key, this.title}) : super(key: key);

  @override
  _TabPageTestControllerState createState() => _TabPageTestControllerState();
}

class _TabPageTestControllerState extends State<TabPageTestController> {
  List<String> dates = <String>[];

  @override
  void initState() {
    super.initState();
    for (var i = 1; i < 30; i++) {
      dates.add('${widget.title}, item $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey<String>(widget.title),
      itemCount: dates.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(dates[index]),
        );
      },
    );
  }
}
