import 'package:flutter/material.dart';

class PageStateWidget extends StatefulWidget {
  @override
  _PageStateWidgetState createState() => _PageStateWidgetState();
}

class _PageStateWidgetState extends State<PageStateWidget> {
  int _selectedIndex = 0;
  PageController _controller = PageController();

  List<BottomNavigationBarItem> navigationItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Page1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.comment),
      label: 'Page2',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Page3',
    ),
  ];
  final _widgetOptions = [
    NavigationPage(),
    NavigationPage(),
    NavigationPage(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _widgetOptions.elementAt(index);
        },
        itemCount: _widgetOptions.length,
        controller: _controller,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationItem,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _controller.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemExtent: 20,
      itemBuilder: (BuildContext context, int index) {
        return Text('Item $index');
      },
    );
  }
}
