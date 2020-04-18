import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AppbarWidget extends StatefulWidget {
  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
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
        MainTitleWidget('Appbar基本使用'),
        AppBar(
          title: Text('Appbar Title'),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.access_alarm),
              tooltip: 'icon1',
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              tooltip: 'icon2',
              onPressed: () => {},
            ),
          ],
        ),
        AppBar(
          title: Text("Center Title"),
          centerTitle: true,
        ),
        AppBar(
          backgroundColor: Colors.green,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Title",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "Subtitle",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
        AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlutterLogo(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Title with image",
                ),
              ),
            ],
          ),
        ),
        AppBar(
          title: Text('With Shape'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        MainTitleWidget('Appbar With Tabs'),
        Expanded(
          child: AppBar(
            title: Text('Title in center'),
            leading: Icon(Icons.home),
            backgroundColor: Colors.purple,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                tooltip: 'icon1',
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                          value: "item1",
                          child: Text('item1 value'),
                        ),
                        PopupMenuItem<String>(
                          value: "item2",
                          child: Text('item2 value'),
                        ),
                      ],
                  onSelected: (String action) {})
            ],
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: "Tabs 1"),
                Tab(text: "Tabs 2"),
                Tab(text: "Tabs 3"),
                Tab(text: "Tabs 4"),
                Tab(text: "Tabs 5"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
